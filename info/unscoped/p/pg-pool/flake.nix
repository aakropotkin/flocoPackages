{

  inputs.packument.url   = "https://registry.npmjs.org/pg-pool?rev=48-08a5141260ce29c92cd2c08cfd25e02d";
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
    ident = "pg-pool";
    ldir  = "info/unscoped/p/pg-pool";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
