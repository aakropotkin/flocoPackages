{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-color-hsl?rev=9-cce4e2b0d574ce758b98d5f7c2bb7e04";
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
    ident = "postcss-color-hsl";
    ldir  = "info/unscoped/p/postcss-color-hsl";
    inherit packument fetchInfo;
  } // latest';

}
