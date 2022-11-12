{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/webpack-hot-middleware?_rev=139-41a99f17bd31553c5f0d3eebc321b248";
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
    ident = "webpack-hot-middleware";
    ldir  = "info/unscoped/w/webpack-hot-middleware";
    inherit packument fetchInfo;
  } // latest';

}
