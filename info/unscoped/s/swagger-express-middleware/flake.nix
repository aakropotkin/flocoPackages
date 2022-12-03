{

  inputs.packument.url   = "https://registry.npmjs.org/swagger-express-middleware";
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
    ident = "swagger-express-middleware";
    ldir  = "info/unscoped/s/swagger-express-middleware";
    inherit packument fetchInfo;
  } // latest';

}
