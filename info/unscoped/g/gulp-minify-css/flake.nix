{

  inputs.packument.url   = "https://registry.npmjs.org/gulp-minify-css?rev=370-78e205b9f84399d72e8bfb7ce62aaf9c";
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
    ident = "gulp-minify-css";
    ldir  = "info/unscoped/g/gulp-minify-css";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
