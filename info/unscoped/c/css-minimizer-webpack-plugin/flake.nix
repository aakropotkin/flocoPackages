{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/css-minimizer-webpack-plugin?_rev=31-dcdffa8f19cc8a76cd42c47800aff5e8";
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
    ident = "css-minimizer-webpack-plugin";
    ldir  = "info/unscoped/c/css-minimizer-webpack-plugin";
    inherit packument fetchInfo;
  } // latest';

}
