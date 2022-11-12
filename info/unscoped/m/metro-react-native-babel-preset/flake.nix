{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/metro-react-native-babel-preset?_rev=79-8f6cb0dcd594527309e1b64fac41256f";
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
    ident = "metro-react-native-babel-preset";
    ldir  = "info/unscoped/m/metro-react-native-babel-preset";
    inherit packument fetchInfo;
  } // latest';

}
