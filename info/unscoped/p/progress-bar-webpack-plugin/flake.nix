{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/progress-bar-webpack-plugin?_rev=40-400e9b117e2cc9d0eda4af4802ec6a64";
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
    ident = "progress-bar-webpack-plugin";
    ldir  = "info/unscoped/p/progress-bar-webpack-plugin";
    inherit packument fetchInfo;
  } // latest';

}
