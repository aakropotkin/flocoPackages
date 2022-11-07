{

  inputs.packument.url   = "https://registry.npmjs.org/@react-native-community/cli-tools?rev=97-6e2a16644b0b696df6ec260760a6390f";
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
    ident = "@react-native-community/cli-tools";
    ldir  = "info/react-native-community/cli-tools";
    inherit packument fetchInfo;
  } // latest';

}
