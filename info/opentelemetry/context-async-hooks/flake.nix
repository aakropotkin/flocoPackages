{

  inputs.packument.url   = "https://registry.npmjs.org/@opentelemetry/context-async-hooks";
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
    ident = "@opentelemetry/context-async-hooks";
    ldir  = "info/opentelemetry/context-async-hooks";
    inherit packument fetchInfo;
  } // latest';

}
