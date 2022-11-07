{

  inputs.packument.url   = "https://registry.npmjs.org/libnpmorg?rev=43-439b826bab85739a8eb9f3c9b9d3bd5f";
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
    ident = "libnpmorg";
    ldir  = "info/unscoped/l/libnpmorg";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
