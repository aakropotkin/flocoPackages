{

  inputs.packument.url   = "https://registry.npmjs.org/gulp-jshint?rev=359-32a668f42ad45d2c9644e9f0de388a1c";
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
    ident = "gulp-jshint";
    ldir  = "info/unscoped/g/gulp-jshint";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
