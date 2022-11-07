{

  inputs.packument.url   = "https://registry.npmjs.org/@react-native-community/cli-server-api?rev=46-5ce0dce0b354b6356d297252591e6a81";
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
    ident = "@react-native-community/cli-server-api";
    ldir  = "info/react-native-community/cli-server-api";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
