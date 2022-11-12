{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/postcss-ordered-values?_rev=58-c5c14e675c49ffde75119b372cd9df0e";
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
    ident = "postcss-ordered-values";
    ldir  = "info/unscoped/p/postcss-ordered-values";
    inherit packument fetchInfo;
  } // latest';

}
