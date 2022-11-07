{

  inputs.packument.url   = "https://registry.npmjs.org/koa-logger?rev=72-88ec329bc053a05a0730b3639ad89fd5";
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
    ident = "koa-logger";
    ldir  = "info/unscoped/k/koa-logger";
    inherit packument fetchInfo;
  } // latest';

}
