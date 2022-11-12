{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-plugin-check-es2015-constants?_rev=87-0f9c0d5a16948803949cedaf93ee04bf";
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
    ident = "babel-plugin-check-es2015-constants";
    ldir  = "info/unscoped/b/babel-plugin-check-es2015-constants";
    inherit packument fetchInfo;
  } // latest';

}
