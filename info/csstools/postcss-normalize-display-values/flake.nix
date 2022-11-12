{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@csstools/postcss-normalize-display-values?_rev=2-ad361d3ff26cf7b2b84d1118b25e888d";
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
    ident = "@csstools/postcss-normalize-display-values";
    ldir  = "info/csstools/postcss-normalize-display-values";
    inherit packument fetchInfo;
  } // latest';

}
