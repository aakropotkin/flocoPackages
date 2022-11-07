{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-minify-selectors?rev=67-9aff231ed4e43fd5bdfbb13f0f464ea2";
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
    ident = "postcss-minify-selectors";
    ldir  = "info/unscoped/p/postcss-minify-selectors";
    inherit packument fetchInfo;
  } // latest';

}
