{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@react-native-community%2fcli-platform-android?_rev=138-4e937528c9537300b8a43fc5f07b8f91";
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
    ident = "@react-native-community/cli-platform-android";
    ldir  = "info/react-native-community/cli-platform-android";
    inherit packument fetchInfo;
  } // latest';

}
