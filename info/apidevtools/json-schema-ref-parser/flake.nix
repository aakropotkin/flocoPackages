{

  inputs.packument.url   = "https://registry.npmjs.org/@apidevtools/json-schema-ref-parser?rev=13-fbc738afee8a6a645ebed9059d418f5e";
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
    ident = "@apidevtools/json-schema-ref-parser";
    ldir  = "info/apidevtools/json-schema-ref-parser";
    inherit packument fetchInfo;
  } // latest';

}
