{

  inputs.packument.url   = "https://registry.npmjs.org/ajv-errors?rev=18-239ac42d831055d4bdc028380b99b303";
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
    ident = "ajv-errors";
    ldir  = "info/unscoped/a/ajv-errors";
    inherit packument fetchInfo;
  } // latest';

}
