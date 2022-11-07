{

  inputs.packument.url   = "https://registry.npmjs.org/react-native-gradle-plugin?rev=28-1d8bdfed2fc39a6fc0f6345166372024";
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
    ident = "react-native-gradle-plugin";
    ldir  = "info/unscoped/r/react-native-gradle-plugin";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
