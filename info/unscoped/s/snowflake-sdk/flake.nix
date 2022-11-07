{

  inputs.packument.url   = "https://registry.npmjs.org/snowflake-sdk?rev=51-8ecd7dffc7989e95b4d0b1138183d764";
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
    ident = "snowflake-sdk";
    ldir  = "info/unscoped/s/snowflake-sdk";
    inherit packument fetchInfo;
  } // latest';

}
