{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@opentelemetry/otlp-exporter-base?_rev=7-65370e37a20bf726da2391f3cf0a84b0";
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
    ident = "@opentelemetry/otlp-exporter-base";
    ldir  = "info/opentelemetry/otlp-exporter-base";
    inherit packument fetchInfo;
  } // latest';

}
