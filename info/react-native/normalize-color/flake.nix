{

  inputs.packument.url   = "https://registry.npmjs.org/@react-native/normalize-color";
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
    scope = "@react-native";
    ident = "@react-native/normalize-color";
    ldir  = "info/react-native/normalize-color";
    inherit packument fetchInfo;
  } // latest';

}
