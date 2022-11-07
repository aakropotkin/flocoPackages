{

  inputs.packument.url   = "https://registry.npmjs.org/gulp-clean-css?rev=247-5d6e612e60bfca97df5d26cc7c02c6d5";
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
    ident = "gulp-clean-css";
    ldir  = "info/unscoped/g/gulp-clean-css";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
