{

  inputs.packument.url   = "https://registry.npmjs.org/sequelize?rev=1294-70fabc504e199aa9a20c8a942d22a853";
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
    ident = "sequelize";
    ldir  = "info/unscoped/s/sequelize";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
