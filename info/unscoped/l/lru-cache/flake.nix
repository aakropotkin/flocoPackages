{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/lru-cache?_rev=271-99ee12702be36b9d19d07e1c78fb8af2";
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
    ident = "lru-cache";
    ldir  = "info/unscoped/l/lru-cache";
    inherit packument fetchInfo;
  } // latest';

}
