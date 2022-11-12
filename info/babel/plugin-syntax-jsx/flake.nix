{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel%2fplugin-syntax-jsx?_rev=79-6bf28ee8bd3bd3a30085b1b1adb98268";
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
    scope = "@babel";
    ident = "@babel/plugin-syntax-jsx";
    ldir  = "info/babel/plugin-syntax-jsx";
    inherit packument fetchInfo;
  } // latest';

}
