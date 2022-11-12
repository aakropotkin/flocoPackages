{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/imagemin-pngquant?_rev=267-addb2146aba18e651176552062ab6af6";
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
    ident = "imagemin-pngquant";
    ldir  = "info/unscoped/i/imagemin-pngquant";
    inherit packument fetchInfo;
  } // latest';

}
