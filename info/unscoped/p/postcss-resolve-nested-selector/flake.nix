{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-resolve-nested-selector?rev=4-e71bf4f2d55eba5ce02354c2637a4481";
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
    ident = "postcss-resolve-nested-selector";
    ldir  = "info/unscoped/p/postcss-resolve-nested-selector";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
