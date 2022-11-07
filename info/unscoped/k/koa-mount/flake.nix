{

  inputs.packument.url   = "https://registry.npmjs.org/koa-mount?rev=51-089d5a1686ba683c489adc6a8d4be6a8";
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
    ident = "koa-mount";
    ldir  = "info/unscoped/k/koa-mount";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
