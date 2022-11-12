{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/gulp-concat?_rev=626-52a6c8004f80a773d8d6495458dc93f2";
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
    ident = "gulp-concat";
    ldir  = "info/unscoped/g/gulp-concat";
    inherit packument fetchInfo;
  } // latest';

}
