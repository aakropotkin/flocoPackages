{

  inputs.packument.url   = "https://registry.npmjs.org/gulp-autoprefixer?rev=520-f67d4c565540cecbec20b87aeff5b381";
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
    ident = "gulp-autoprefixer";
    ldir  = "info/unscoped/g/gulp-autoprefixer";
    inherit packument fetchInfo;
  } // latest';

}
