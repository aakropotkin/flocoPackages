{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/simple-swizzle?_rev=7-85ea6e3c651ce66c534552cac5042218";
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
    ident = "simple-swizzle";
    ldir  = "info/unscoped/s/simple-swizzle";
    inherit packument fetchInfo;
  } // latest';

}
