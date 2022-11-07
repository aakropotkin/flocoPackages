{

  inputs.packument.url   = "https://registry.npmjs.org/json-schema-ref-parser?rev=101-d522d3e2d6ed3d3238061463fb57989a";
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
    ident = "json-schema-ref-parser";
    ldir  = "info/unscoped/j/json-schema-ref-parser";
    inherit packument fetchInfo;
  } // latest';

}
