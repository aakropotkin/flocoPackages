{

  inputs.packument.url   = "https://registry.npmjs.org/value-or-function?rev=15-c244866eddb7653a8f1b9cfc22c36f29";
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
    ident = "value-or-function";
    ldir  = "info/unscoped/v/value-or-function";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
