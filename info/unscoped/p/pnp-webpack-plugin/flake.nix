{

  inputs.packument.url   = "https://registry.npmjs.org/pnp-webpack-plugin?rev=19-3503dab01bdc5d08485c6733d90d94d6";
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
    ident = "pnp-webpack-plugin";
    ldir  = "info/unscoped/p/pnp-webpack-plugin";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
