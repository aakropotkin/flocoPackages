{

  inputs.packument.url   = "https://registry.npmjs.org/friendly-errors-webpack-plugin";
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
    ident = "friendly-errors-webpack-plugin";
    ldir  = "info/unscoped/f/friendly-errors-webpack-plugin";
    inherit packument fetchInfo;
  } // latest';

}
