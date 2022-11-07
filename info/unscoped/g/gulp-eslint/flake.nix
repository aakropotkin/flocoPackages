{

  inputs.packument.url   = "https://registry.npmjs.org/gulp-eslint?rev=188-0fd975e5fa184f69fadd98df166c2679";
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
    ident = "gulp-eslint";
    ldir  = "info/unscoped/g/gulp-eslint";
    inherit packument fetchInfo;
  } // latest';

}
