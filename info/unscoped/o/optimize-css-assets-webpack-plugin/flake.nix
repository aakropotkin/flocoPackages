{

  inputs.packument.url   = "https://registry.npmjs.org/optimize-css-assets-webpack-plugin?rev=54-2a95812d1748d539d14e5f0ad9d9da99";
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
    ident = "optimize-css-assets-webpack-plugin";
    ldir  = "info/unscoped/o/optimize-css-assets-webpack-plugin";
    inherit packument fetchInfo;
  } // latest';

}
