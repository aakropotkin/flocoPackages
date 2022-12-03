{

  inputs.packument.url   = "https://registry.npmjs.org/@opentelemetry/exporter-trace-otlp-http";
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
    ident = "@opentelemetry/exporter-trace-otlp-http";
    ldir  = "info/opentelemetry/exporter-trace-otlp-http";
    inherit packument fetchInfo;
  } // latest';

}
