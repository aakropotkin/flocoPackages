{

  inputs.packument.url   = "https://registry.npmjs.org/mozjpeg?rev=89-69b26301cb72dc65de238c695cb26c92";
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
    ident = "mozjpeg";
    ldir  = "info/unscoped/m/mozjpeg";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
