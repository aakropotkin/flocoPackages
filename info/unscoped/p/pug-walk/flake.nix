{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/pug-walk?_rev=34-dd4c6191221a2e08ce859a0d39e475c1";
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
    ident = "pug-walk";
    ldir  = "info/unscoped/p/pug-walk";
    inherit packument fetchInfo;
  } // latest';

}
