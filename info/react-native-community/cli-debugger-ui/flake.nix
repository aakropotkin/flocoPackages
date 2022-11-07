{

  inputs.packument.url   = "https://registry.npmjs.org/@react-native-community/cli-debugger-ui?rev=42-4e2f552c44aa3d4267799e7f726cb19e";
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
    ident = "@react-native-community/cli-debugger-ui";
    ldir  = "info/react-native-community/cli-debugger-ui";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
