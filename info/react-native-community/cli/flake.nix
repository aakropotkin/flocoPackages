{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@react-native-community/cli?_rev=214-3a1c3abac6714f9d0925145fbccd9b7e";
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
    scope = "@react-native-community";
    ident = "@react-native-community/cli";
    ldir  = "info/react-native-community/cli";
    inherit packument fetchInfo;
  } // latest';

}
