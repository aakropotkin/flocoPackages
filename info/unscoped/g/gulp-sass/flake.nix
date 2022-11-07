{

  inputs.packument.url   = "https://registry.npmjs.org/gulp-sass?rev=669-fea00e30c9398e6c85f975d6f674f906";
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
    ident = "gulp-sass";
    ldir  = "info/unscoped/g/gulp-sass";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
