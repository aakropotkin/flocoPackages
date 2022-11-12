{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@opentelemetry/api?_rev=74-750c6b089eb81ef17b44f40c529fa955";
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
    ident = "@opentelemetry/api";
    ldir  = "info/opentelemetry/api";
    inherit packument fetchInfo;
  } // latest';

}
