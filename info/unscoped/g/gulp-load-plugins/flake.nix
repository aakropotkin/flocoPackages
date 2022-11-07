{

  inputs.packument.url   = "https://registry.npmjs.org/gulp-load-plugins?rev=341-6c01d5f988f54162916374a10efb3404";
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
    ident = "gulp-load-plugins";
    ldir  = "info/unscoped/g/gulp-load-plugins";
    inherit packument fetchInfo;
  } // latest';

}
