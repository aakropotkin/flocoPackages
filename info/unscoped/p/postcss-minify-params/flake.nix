{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-minify-params?rev=57-a2920cad535c7e698e1a5c33a2f57ebd";
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
    ident = "postcss-minify-params";
    ldir  = "info/unscoped/p/postcss-minify-params";
    inherit packument fetchInfo;
  } // latest';

}
