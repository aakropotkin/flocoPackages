{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/imagemin-gifsicle?_rev=172-5b06d3713d76f84a6d51c9e831f240e9";
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
    ident = "imagemin-gifsicle";
    ldir  = "info/unscoped/i/imagemin-gifsicle";
    inherit packument fetchInfo;
  } // latest';

}
