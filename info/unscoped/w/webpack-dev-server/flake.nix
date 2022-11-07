{

  inputs.packument.url   = "https://registry.npmjs.org/webpack-dev-server?rev=441-3a64f813f452fccc4a24ba3cd33f13ea";
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
    ident = "webpack-dev-server";
    ldir  = "info/unscoped/w/webpack-dev-server";
    inherit packument fetchInfo;
  } // latest';

}
