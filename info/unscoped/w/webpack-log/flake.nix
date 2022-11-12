{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/webpack-log?_rev=20-50d24d3e0f0c1775d25d33a3756be7c9";
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
    ident = "webpack-log";
    ldir  = "info/unscoped/w/webpack-log";
    inherit packument fetchInfo;
  } // latest';

}
