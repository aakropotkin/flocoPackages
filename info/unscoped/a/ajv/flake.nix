{

  inputs.packument.url   = "https://registry.npmjs.org/ajv?rev=476-bc3ad3e960115fb1533f44f4311df08a";
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
    ident = "ajv";
    ldir  = "info/unscoped/a/ajv";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
