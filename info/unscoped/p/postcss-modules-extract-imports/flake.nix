{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/postcss-modules-extract-imports?_rev=26-e03dedc5f87e44ead5e86e1a3e21c054";
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
    ident = "postcss-modules-extract-imports";
    ldir  = "info/unscoped/p/postcss-modules-extract-imports";
    inherit packument fetchInfo;
  } // latest';

}
