{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-normalize-display-values?rev=37-997149325195b48b35b52e987f8f6fe3";
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
    ident = "postcss-normalize-display-values";
    ldir  = "info/unscoped/p/postcss-normalize-display-values";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
