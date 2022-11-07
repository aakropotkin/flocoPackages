{

  inputs.packument.url   = "https://registry.npmjs.org/koa-router?rev=252-5577d349a96d915acc3b9cf979859fee";
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
    ident = "koa-router";
    ldir  = "info/unscoped/k/koa-router";
    inherit packument fetchInfo;
  } // latest';

}
