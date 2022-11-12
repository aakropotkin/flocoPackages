{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/gulp-shell?_rev=160-0d450ebfbcffc3ef6ad8b7dc7e85918b";
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
    ident = "gulp-shell";
    ldir  = "info/unscoped/g/gulp-shell";
    inherit packument fetchInfo;
  } // latest';

}
