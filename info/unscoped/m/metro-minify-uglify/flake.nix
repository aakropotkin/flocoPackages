{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/metro-minify-uglify?_rev=106-145f781b6017e127b149592660615f42";
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
    ident = "metro-minify-uglify";
    ldir  = "info/unscoped/m/metro-minify-uglify";
    inherit packument fetchInfo;
  } // latest';

}
