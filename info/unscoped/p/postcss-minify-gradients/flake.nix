{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-minify-gradients?rev=49-5e72eb4d9f38ae15a26e4d7abe00bd6a";
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
    ident = "postcss-minify-gradients";
    ldir  = "info/unscoped/p/postcss-minify-gradients";
    inherit packument fetchInfo;
  } // latest';

}
