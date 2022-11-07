{

  inputs.packument.url   = "https://registry.npmjs.org/metro-react-native-babel-transformer?rev=49-dffb9713b746785114fa7b230d3cc58a";
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
    scope = null;
    ident = "metro-react-native-babel-transformer";
    ldir  = "info/unscoped/m/metro-react-native-babel-transformer";
    inherit packument fetchInfo;
  } // latest';

}
