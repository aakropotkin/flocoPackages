{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/gulp-replace?_rev=187-87462be4877d1e5b1a1ed1c3e04c9f8b";
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
    ident = "gulp-replace";
    ldir  = "info/unscoped/g/gulp-replace";
    inherit packument fetchInfo;
  } // latest';

}
