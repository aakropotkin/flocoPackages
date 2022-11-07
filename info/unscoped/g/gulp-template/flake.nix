{

  inputs.packument.url   = "https://registry.npmjs.org/gulp-template?rev=73-a828ac06aa96a4074d092e6f4a8ba7f6";
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
    ident = "gulp-template";
    ldir  = "info/unscoped/g/gulp-template";
    inherit packument fetchInfo;
  } // latest';

}
