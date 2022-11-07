{

  inputs.packument.url   = "https://registry.npmjs.org/gulp-install?rev=66-434ac016607c05cf546571dd8ab2c26a";
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
    ident = "gulp-install";
    ldir  = "info/unscoped/g/gulp-install";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
