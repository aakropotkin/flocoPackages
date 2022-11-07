{

  inputs.packument.url   = "https://registry.npmjs.org/@apidevtools/swagger-methods?rev=6-b54ee9e56c243222ab341d81213f5c58";
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
    ident = "@apidevtools/swagger-methods";
    ldir  = "info/apidevtools/swagger-methods";
    inherit packument fetchInfo;
  } // latest';

}
