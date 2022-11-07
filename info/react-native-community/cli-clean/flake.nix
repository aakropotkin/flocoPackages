{

  inputs.packument.url   = "https://registry.npmjs.org/@react-native-community/cli-clean?rev=17-8e1d6f8b0743db8f11fca2bd1cc59686";
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
    ident = "@react-native-community/cli-clean";
    ldir  = "info/react-native-community/cli-clean";
    inherit packument fetchInfo;
  } // latest';

}
