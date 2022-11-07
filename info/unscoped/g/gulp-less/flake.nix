{

  inputs.packument.url   = "https://registry.npmjs.org/gulp-less?rev=277-65339cc71a56c1f6f763f6505775656d";
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
    ident = "gulp-less";
    ldir  = "info/unscoped/g/gulp-less";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
