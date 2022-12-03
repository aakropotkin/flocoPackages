{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-pseudo-class-any-link";
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
    ident = "postcss-pseudo-class-any-link";
    ldir  = "info/unscoped/p/postcss-pseudo-class-any-link";
    inherit packument fetchInfo;
  } // latest';

}
