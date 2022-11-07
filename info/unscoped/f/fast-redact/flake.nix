{

  inputs.packument.url   = "https://registry.npmjs.org/fast-redact?rev=33-4642b18b3981afd9b4e9b616b840079d";
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
    ident = "fast-redact";
    ldir  = "info/unscoped/f/fast-redact";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
