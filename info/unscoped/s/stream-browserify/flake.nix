{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/stream-browserify?_rev=51-57f2398f2c6c4f64d394e1a770e5c7ae";
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
    ident = "stream-browserify";
    ldir  = "info/unscoped/s/stream-browserify";
    inherit packument fetchInfo;
  } // latest';

}
