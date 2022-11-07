{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-flexbugs-fixes?rev=33-15ecec5d5b3d0e12bbd7a605da2d5372";
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
    ident = "postcss-flexbugs-fixes";
    ldir  = "info/unscoped/p/postcss-flexbugs-fixes";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
