{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/webpack-dev-middleware?_rev=203-cdcf54fe68ab3b88057ebf2ca431f655";
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
    ident = "webpack-dev-middleware";
    ldir  = "info/unscoped/w/webpack-dev-middleware";
    inherit packument fetchInfo;
  } // latest';

}
