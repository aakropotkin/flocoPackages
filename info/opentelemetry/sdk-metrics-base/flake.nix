{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@opentelemetry%2fsdk-metrics-base?_rev=27-679c298f0d9bbcfe7705d50378a97305";
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
    ident = "@opentelemetry/sdk-metrics-base";
    ldir  = "info/opentelemetry/sdk-metrics-base";
    inherit packument fetchInfo;
  } // latest';

}
