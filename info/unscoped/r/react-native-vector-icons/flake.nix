{

  inputs.packument.url   = "https://registry.npmjs.org/react-native-vector-icons?rev=136-eb94be3d4a926b5f16c9ab896955b062";
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
    ident = "react-native-vector-icons";
    ldir  = "info/unscoped/r/react-native-vector-icons";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
