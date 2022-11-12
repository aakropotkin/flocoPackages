{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/redux-saga?_rev=132-9309925970db2913ca5edcf5a59ba55b";
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
    ident = "redux-saga";
    ldir  = "info/unscoped/r/redux-saga";
    inherit packument fetchInfo;
  } // latest';

}
