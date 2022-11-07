{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-calc?rev=50-40c1848df294a906abdcf04e0d465a91";
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
    ident = "postcss-calc";
    ldir  = "info/unscoped/p/postcss-calc";
    inherit packument fetchInfo;
  } // latest';

}
