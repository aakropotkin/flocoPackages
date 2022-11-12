{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/koa-send?_rev=69-a9447796b042b0561edc5c60e43da61c";
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
    ident = "koa-send";
    ldir  = "info/unscoped/k/koa-send";
    inherit packument fetchInfo;
  } // latest';

}
