{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@redux-saga/is?_rev=14-07c4db912919deb5664f1b5d2d7afe3d";
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
    scope = "@redux-saga";
    ident = "@redux-saga/is";
    ldir  = "info/redux-saga/is";
    inherit packument fetchInfo;
  } // latest';

}
