{

  inputs.packument.url   = "https://registry.npmjs.org/json-schema-faker-bb?rev=3-5df8e168e950001773c1ccfee7badae4";
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
    ident = "json-schema-faker-bb";
    ldir  = "info/unscoped/j/json-schema-faker-bb";
    inherit packument fetchInfo;
  } // latest';

}
