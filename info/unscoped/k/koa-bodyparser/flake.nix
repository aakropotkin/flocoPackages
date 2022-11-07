{

  inputs.packument.url   = "https://registry.npmjs.org/koa-bodyparser?rev=86-f8290278f364f5648ea2c7ad4cf41d9e";
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
    ident = "koa-bodyparser";
    ldir  = "info/unscoped/k/koa-bodyparser";
    inherit packument fetchInfo;
  } // latest';

}
