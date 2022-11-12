{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/caching-transform?_rev=19-27084e43cff152d2b03948e433ca4b5a";
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
    ident = "caching-transform";
    ldir  = "info/unscoped/c/caching-transform";
    inherit packument fetchInfo;
  } // latest';

}
