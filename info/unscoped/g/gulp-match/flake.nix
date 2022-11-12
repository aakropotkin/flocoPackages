{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/gulp-match?_rev=31-9a91149c43043e05caae3546f80dc307";
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
    ident = "gulp-match";
    ldir  = "info/unscoped/g/gulp-match";
    inherit packument fetchInfo;
  } // latest';

}
