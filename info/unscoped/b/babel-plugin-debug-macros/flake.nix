{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-plugin-debug-macros?_rev=33-d1442225d7f95232a2e8e75c615d1f96";
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
    ident = "babel-plugin-debug-macros";
    ldir  = "info/unscoped/b/babel-plugin-debug-macros";
    inherit packument fetchInfo;
  } // latest';

}
