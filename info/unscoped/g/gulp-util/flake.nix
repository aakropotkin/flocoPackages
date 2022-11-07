{

  inputs.packument.url   = "https://registry.npmjs.org/gulp-util?rev=363-574a913927c1341f66964c5460668f40";
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
    ident = "gulp-util";
    ldir  = "info/unscoped/g/gulp-util";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
