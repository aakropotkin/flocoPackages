{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/postcss-color-rgba-fallback?_rev=19-992fce435c6abf4c4f2406d3855221b5";
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
    ident = "postcss-color-rgba-fallback";
    ldir  = "info/unscoped/p/postcss-color-rgba-fallback";
    inherit packument fetchInfo;
  } // latest';

}
