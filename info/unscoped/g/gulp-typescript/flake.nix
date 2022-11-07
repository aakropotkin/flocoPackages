{

  inputs.packument.url   = "https://registry.npmjs.org/gulp-typescript?rev=194-5ff19e6af5b1e1e36986da44d0196243";
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
    ident = "gulp-typescript";
    ldir  = "info/unscoped/g/gulp-typescript";
    inherit packument fetchInfo;
  } // latest';

}
