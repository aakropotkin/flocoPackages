{

  inputs.packument.url   = "https://registry.npmjs.org/es-shim-unscopables";
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
    ident = "es-shim-unscopables";
    ldir  = "info/unscoped/e/es-shim-unscopables";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
