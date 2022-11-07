{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-dir-pseudo-class?rev=17-c2042f2d7851143907ed1c7389e0f52d";
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
    ident = "postcss-dir-pseudo-class";
    ldir  = "info/unscoped/p/postcss-dir-pseudo-class";
    inherit packument fetchInfo;
  } // latest';

}
