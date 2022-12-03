{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-modules-extract-imports";
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
