{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-double-position-gradients";
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
    ident = "postcss-double-position-gradients";
    ldir  = "info/unscoped/p/postcss-double-position-gradients";
    inherit packument fetchInfo;
  } // latest';

}
