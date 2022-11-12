{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/cordova?_rev=543-f375536f978bee9b1b2910d03a662b39";
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
    scope = "@types";
    ident = "@types/cordova";
    ldir  = "info/types/cordova";
    inherit packument fetchInfo;
  } // latest';

}
