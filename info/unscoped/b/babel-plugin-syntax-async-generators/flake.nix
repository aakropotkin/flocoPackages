{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-plugin-syntax-async-generators?_rev=67-1d414e29eb7bc1238e2039d200c18ca7";
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
    ident = "babel-plugin-syntax-async-generators";
    ldir  = "info/unscoped/b/babel-plugin-syntax-async-generators";
    inherit packument fetchInfo;
  } // latest';

}
