{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@gulp-sourcemaps%2fidentity-map?_rev=9-6449d80137953fc3d8db159629487d91";
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
    ident = "@gulp-sourcemaps/identity-map";
    ldir  = "info/gulp-sourcemaps/identity-map";
    inherit packument fetchInfo;
  } // latest';

}
