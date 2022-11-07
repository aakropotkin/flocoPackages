{

  inputs.packument.url   = "https://registry.npmjs.org/webpack-node-externals?rev=63-1ef4f1543f0ac203bb825c2a0090dde8";
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
    ident = "webpack-node-externals";
    ldir  = "info/unscoped/w/webpack-node-externals";
    inherit packument fetchInfo;
  } // latest';

}
