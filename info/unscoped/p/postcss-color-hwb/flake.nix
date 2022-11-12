{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/postcss-color-hwb?_rev=12-79015230708fdfdfe381e706bb0de359";
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
    ident = "postcss-color-hwb";
    ldir  = "info/unscoped/p/postcss-color-hwb";
    inherit packument fetchInfo;
  } // latest';

}
