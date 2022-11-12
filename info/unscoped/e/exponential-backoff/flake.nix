{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/exponential-backoff?_rev=51-7f3b7db17bf0a60701db41857df32f91";
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
    ident = "exponential-backoff";
    ldir  = "info/unscoped/e/exponential-backoff";
    inherit packument fetchInfo;
  } // latest';

}
