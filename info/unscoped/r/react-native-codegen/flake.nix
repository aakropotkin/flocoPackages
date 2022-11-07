{

  inputs.packument.url   = "https://registry.npmjs.org/react-native-codegen?rev=50-3ef0702483011366b290459c80f19ff7";
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
    ident = "react-native-codegen";
    ldir  = "info/unscoped/r/react-native-codegen";
    inherit packument fetchInfo;
  } // latest';

}
