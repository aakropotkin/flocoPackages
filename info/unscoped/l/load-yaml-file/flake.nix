{

  inputs.packument.url   = "https://registry.npmjs.org/load-yaml-file?rev=7-a7d9bbac7db471eb5458954082ffe2f1";
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
    ident = "load-yaml-file";
    ldir  = "info/unscoped/l/load-yaml-file";
    inherit packument fetchInfo;
  } // latest';

}
