{

  inputs.packument.url   = "https://registry.npmjs.org/vinyl-sourcemap?rev=13-f715e9a81dedee130736a4fe2137ebd9";
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
    ident = "vinyl-sourcemap";
    ldir  = "info/unscoped/v/vinyl-sourcemap";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
