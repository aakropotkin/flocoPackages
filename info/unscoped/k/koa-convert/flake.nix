{

  inputs.packument.url   = "https://registry.npmjs.org/koa-convert?rev=29-f3e4c45705c471e76b2ea28cfd6f6760";
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
    ident = "koa-convert";
    ldir  = "info/unscoped/k/koa-convert";
    inherit packument fetchInfo;
  } // latest';

}
