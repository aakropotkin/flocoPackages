{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/deferred-leveldown?_rev=49-e36585874a963c3df1c03fb042866eb8";
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
    ident = "deferred-leveldown";
    ldir  = "info/unscoped/d/deferred-leveldown";
    inherit packument fetchInfo;
  } // latest';

}
