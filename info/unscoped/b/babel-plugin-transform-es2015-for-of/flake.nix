{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-plugin-transform-es2015-for-of?_rev=80-bd46666ff127076e45cab2f2b5810f5a";
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
    ident = "babel-plugin-transform-es2015-for-of";
    ldir  = "info/unscoped/b/babel-plugin-transform-es2015-for-of";
    inherit packument fetchInfo;
  } // latest';

}
