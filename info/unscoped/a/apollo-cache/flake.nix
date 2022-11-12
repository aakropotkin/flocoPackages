{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/apollo-cache?_rev=122-316d12a806126636eb314fe5bb4dfa47";
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
    ident = "apollo-cache";
    ldir  = "info/unscoped/a/apollo-cache";
    inherit packument fetchInfo;
  } // latest';

}
