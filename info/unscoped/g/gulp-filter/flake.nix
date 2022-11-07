{

  inputs.packument.url   = "https://registry.npmjs.org/gulp-filter?rev=192-dc7314ce4dc2eb45e0ce28764996c27a";
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
    ident = "gulp-filter";
    ldir  = "info/unscoped/g/gulp-filter";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
