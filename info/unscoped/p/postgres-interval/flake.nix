{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/postgres-interval?_rev=15-2b6776cca58416c8e46a7e768f0c91ab";
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
    ident = "postgres-interval";
    ldir  = "info/unscoped/p/postgres-interval";
    inherit packument fetchInfo;
  } // latest';

}
