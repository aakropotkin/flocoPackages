{

  inputs.packument.url   = "https://registry.npmjs.org/vinyl-sourcemaps-apply";
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
    ident = "vinyl-sourcemaps-apply";
    ldir  = "info/unscoped/v/vinyl-sourcemaps-apply";
    inherit packument fetchInfo;
  } // latest';

}
