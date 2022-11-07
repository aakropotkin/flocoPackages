{

  inputs.packument.url   = "https://registry.npmjs.org/gulp-conflict?rev=26-58dbe3138a8dfcbd3c4fd0fec70fcffb";
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
    ident = "gulp-conflict";
    ldir  = "info/unscoped/g/gulp-conflict";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
