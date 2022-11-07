{

  inputs.packument.url   = "https://registry.npmjs.org/react-native?rev=1396-66eca702d5c0cb178e78c16257b72c39";
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
    ident = "react-native";
    ldir  = "info/unscoped/r/react-native";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
