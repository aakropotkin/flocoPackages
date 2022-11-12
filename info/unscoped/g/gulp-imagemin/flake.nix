{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/gulp-imagemin?_rev=498-2fc80e762ab2002b6d1f5f0fd729fc97";
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
    ident = "gulp-imagemin";
    ldir  = "info/unscoped/g/gulp-imagemin";
    inherit packument fetchInfo;
  } // latest';

}
