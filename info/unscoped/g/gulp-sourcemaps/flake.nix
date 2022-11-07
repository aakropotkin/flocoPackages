{

  inputs.packument.url   = "https://registry.npmjs.org/gulp-sourcemaps?rev=513-822a7754bcecd3d2d090016d3a670b27";
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
    ident = "gulp-sourcemaps";
    ldir  = "info/unscoped/g/gulp-sourcemaps";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
