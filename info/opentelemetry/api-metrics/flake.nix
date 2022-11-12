{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@opentelemetry/api-metrics?_rev=78-a4ab7bd23048642cf1c115a38ee43d65";
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
    scope = "@opentelemetry";
    ident = "@opentelemetry/api-metrics";
    ldir  = "info/opentelemetry/api-metrics";
    inherit packument fetchInfo;
  } // latest';

}
