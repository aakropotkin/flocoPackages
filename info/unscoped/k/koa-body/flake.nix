{

  inputs.packument.url   = "https://registry.npmjs.org/koa-body?rev=82-444dbd4a917b9115c7d695d09af759e4";
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
    ident = "koa-body";
    ldir  = "info/unscoped/k/koa-body";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
