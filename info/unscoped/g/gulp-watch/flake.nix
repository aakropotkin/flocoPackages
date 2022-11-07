{

  inputs.packument.url   = "https://registry.npmjs.org/gulp-watch?rev=410-f3410bed29b85a020f5dd646c0704c0b";
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
    ident = "gulp-watch";
    ldir  = "info/unscoped/g/gulp-watch";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
