{

  inputs.packument.url   = "https://registry.npmjs.org/imagemin-svgo?rev=212-e39a80c816e0547b41f8e407171c2aa8";
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
    ident = "imagemin-svgo";
    ldir  = "info/unscoped/i/imagemin-svgo";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
