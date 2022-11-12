{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel%2fplugin-syntax-json-strings?_rev=33-4b621f9a64e5be6ebbecb5b1717d28d2";
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
    ident = "@babel/plugin-syntax-json-strings";
    ldir  = "info/babel/plugin-syntax-json-strings";
    inherit packument fetchInfo;
  } // latest';

}
