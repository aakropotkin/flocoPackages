{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/sequelize-pool?_rev=16-1ee193138765ad8428c07020c240b212";
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
    ident = "sequelize-pool";
    ldir  = "info/unscoped/s/sequelize-pool";
    inherit packument fetchInfo;
  } // latest';

}
