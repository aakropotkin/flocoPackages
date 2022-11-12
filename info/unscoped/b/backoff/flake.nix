{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/backoff?_rev=68-83a0d0227794a8acf9d91150a174fe19";
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
    ident = "backoff";
    ldir  = "info/unscoped/b/backoff";
    inherit packument fetchInfo;
  } // latest';

}
