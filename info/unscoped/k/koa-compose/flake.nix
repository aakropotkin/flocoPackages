{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/koa-compose?_rev=81-fd885671955f846e38398d87d7674101";
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
    ident = "koa-compose";
    ldir  = "info/unscoped/k/koa-compose";
    inherit packument fetchInfo;
  } // latest';

}
