{

  inputs.packument.url   = "https://registry.npmjs.org/@apidevtools/openapi-schemas?rev=9-1727f9fdb1ed8652ba7a9b3189ae2ac6";
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
    ident = "@apidevtools/openapi-schemas";
    ldir  = "info/apidevtools/openapi-schemas";
    inherit packument fetchInfo;
  } // latest';

}
