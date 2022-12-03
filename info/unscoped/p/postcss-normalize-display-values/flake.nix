{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-normalize-display-values";
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
    inherit packument fetchInfo;
  } // latest';

}
