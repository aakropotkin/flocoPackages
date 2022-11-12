{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@csstools%2fpostcss-progressive-custom-properties?_rev=4-c0d8d036578404ccecc61a47c3ba0a34";
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
    ident = "@csstools/postcss-progressive-custom-properties";
    ldir  = "info/csstools/postcss-progressive-custom-properties";
    inherit packument fetchInfo;
  } // latest';

}
