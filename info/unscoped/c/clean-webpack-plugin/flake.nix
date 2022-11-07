{

  inputs.packument.url   = "https://registry.npmjs.org/clean-webpack-plugin?rev=79-8604ab7214643011f4756ac37f7cce71";
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
    ident = "clean-webpack-plugin";
    ldir  = "info/unscoped/c/clean-webpack-plugin";
    inherit packument fetchInfo;
  } // latest';

}
