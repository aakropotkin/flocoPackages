{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@csstools/postcss-unset-value?_rev=3-fc61dfabf2e24f2b796f4c0ef81e0024";
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
    scope = "@csstools";
    ident = "@csstools/postcss-unset-value";
    ldir  = "info/csstools/postcss-unset-value";
    inherit packument fetchInfo;
  } // latest';

}
