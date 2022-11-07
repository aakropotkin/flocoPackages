{

  inputs.packument.url   = "https://registry.npmjs.org/load-json-file?rev=32-d47be07db3c7204f46bd7c5f00607e52";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "load-json-file";
    ldir  = "info/unscoped/l/load-json-file";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
