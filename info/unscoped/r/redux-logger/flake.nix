{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/redux-logger?_rev=127-195a6e459190e9679d4f005a892ae4d3";
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
    ident = "redux-logger";
    ldir  = "info/unscoped/r/redux-logger";
    inherit packument fetchInfo;
  } // latest';

}
