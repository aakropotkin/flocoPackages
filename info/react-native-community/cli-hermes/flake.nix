{

  inputs.packument.url   = "https://registry.npmjs.org/@react-native-community/cli-hermes?rev=48-7efd5e498162a0616f07b6b03ed4c6e5";
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
    ident = "@react-native-community/cli-hermes";
    ldir  = "info/react-native-community/cli-hermes";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
