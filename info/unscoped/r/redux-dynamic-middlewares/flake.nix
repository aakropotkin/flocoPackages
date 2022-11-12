{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/redux-dynamic-middlewares?_rev=18-4ec8c368e5723f2b41bd86e8fb586413";
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
    ident = "redux-dynamic-middlewares";
    ldir  = "info/unscoped/r/redux-dynamic-middlewares";
    inherit packument fetchInfo;
  } // latest';

}
