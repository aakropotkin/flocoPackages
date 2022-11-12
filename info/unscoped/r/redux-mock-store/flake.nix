{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/redux-mock-store?_rev=59-a9ece58c27791a6c06c85b8db6cc4620";
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
    ident = "redux-mock-store";
    ldir  = "info/unscoped/r/redux-mock-store";
    inherit packument fetchInfo;
  } // latest';

}
