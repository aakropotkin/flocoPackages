{

  inputs.packument.url   = "https://registry.npmjs.org/@react-native-community/cli-config?rev=29-9f8b290d005a7277e0efda75968d47e1";
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
    ident = "@react-native-community/cli-config";
    ldir  = "info/react-native-community/cli-config";
    inherit packument fetchInfo;
  } // latest';

}
