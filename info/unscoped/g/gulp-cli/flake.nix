{

  inputs.packument.url   = "https://registry.npmjs.org/gulp-cli?rev=79-3788ca3201212330773e1918f5eb6928";
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
    ident = "gulp-cli";
    ldir  = "info/unscoped/g/gulp-cli";
    inherit packument fetchInfo;
  } // latest';

}
