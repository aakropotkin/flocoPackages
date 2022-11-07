{

  inputs.packument.url   = "https://registry.npmjs.org/@react-native-community/cli-platform-ios?rev=130-0d93ed68f79c16b6b9191a6add2b4ed1";
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
    ident = "@react-native-community/cli-platform-ios";
    ldir  = "info/react-native-community/cli-platform-ios";
    inherit packument fetchInfo;
  } // latest';

}
