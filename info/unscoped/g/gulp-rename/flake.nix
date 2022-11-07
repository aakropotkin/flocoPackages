{

  inputs.packument.url   = "https://registry.npmjs.org/gulp-rename?rev=418-97fb0202ba94e127028c02431dc8a7be";
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
    ident = "gulp-rename";
    ldir  = "info/unscoped/g/gulp-rename";
    inherit packument fetchInfo;
  } // latest';

}
