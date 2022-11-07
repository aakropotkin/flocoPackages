{

  inputs.packument.url   = "https://registry.npmjs.org/@react-native-community/cli-doctor?rev=34-d0b73f370c271f87cfb08047104328ec";
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
    ident = "@react-native-community/cli-doctor";
    ldir  = "info/react-native-community/cli-doctor";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
