{

  inputs.packument.url   = "https://registry.npmjs.org/gulp-plumber?rev=319-c04e9477cfedc2fe5820e005c83913ed";
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
    ident = "gulp-plumber";
    ldir  = "info/unscoped/g/gulp-plumber";
    inherit packument fetchInfo;
  } // latest';

}
