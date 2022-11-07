{

  inputs.packument.url   = "https://registry.npmjs.org/lodash.isfinite?rev=40-95b0b1bd71625126ce989cf25fd53b46";
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
    ident = "lodash.isfinite";
    ldir  = "info/unscoped/l/lodash.isfinite";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
