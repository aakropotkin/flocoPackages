{

  inputs.packument.url   = "https://registry.npmjs.org/css-to-react-native?rev=28-5f8610fa7c76f3cac1ab3d6e3dc79daa";
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
    ident = "css-to-react-native";
    ldir  = "info/unscoped/c/css-to-react-native";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
