{

  inputs.packument.url   = "https://registry.npmjs.org/@react-native/assets?rev=14-95c5d279b65e525c31e7b94fbf026b32";
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
    ident = "@react-native/assets";
    ldir  = "info/react-native/assets";
    inherit packument fetchInfo;
  } // latest';

}
