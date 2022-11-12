{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@react-native-community%2fcli-types?_rev=48-541787c383e835cd355d5cffca261fe3";
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
    ident = "@react-native-community/cli-types";
    ldir  = "info/react-native-community/cli-types";
    inherit packument fetchInfo;
  } // latest';

}
