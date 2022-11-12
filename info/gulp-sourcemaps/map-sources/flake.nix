{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@gulp-sourcemaps/map-sources?_rev=8-fa247e9dda7192e792913e692156a9dc";
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
    scope = "@gulp-sourcemaps";
    ident = "@gulp-sourcemaps/map-sources";
    ldir  = "info/gulp-sourcemaps/map-sources";
    inherit packument fetchInfo;
  } // latest';

}
