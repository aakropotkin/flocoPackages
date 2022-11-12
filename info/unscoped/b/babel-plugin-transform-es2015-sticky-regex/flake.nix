{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-plugin-transform-es2015-sticky-regex?_rev=63-3c678e29da1396d0866afb855e485853";
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
    ident = "babel-plugin-transform-es2015-sticky-regex";
    ldir  = "info/unscoped/b/babel-plugin-transform-es2015-sticky-regex";
    inherit packument fetchInfo;
  } // latest';

}
