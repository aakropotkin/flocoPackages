{

  inputs.packument.url   = "https://registry.npmjs.org/@react-native/polyfills?rev=15-99cfa13cc5b60c3b4195f65ee0ebaeea";
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
    ident = "@react-native/polyfills";
    ldir  = "info/react-native/polyfills";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
