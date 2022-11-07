{

  inputs.packument.url   = "https://registry.npmjs.org/@apidevtools/swagger-express-middleware?rev=8-6a8f7cf6b76817ea013dddbf0a410521";
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
    scope = "@apidevtools";
    ident = "@apidevtools/swagger-express-middleware";
    ldir  = "info/apidevtools/swagger-express-middleware";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
