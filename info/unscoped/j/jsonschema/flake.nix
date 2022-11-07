{

  inputs.packument.url   = "https://registry.npmjs.org/jsonschema?rev=124-827d36638c56903618cf8a863c33b138";
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
    ident = "jsonschema";
    ldir  = "info/unscoped/j/jsonschema";
    inherit packument fetchInfo;
  } // latest';

}
