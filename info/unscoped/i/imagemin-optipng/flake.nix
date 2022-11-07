{

  inputs.packument.url   = "https://registry.npmjs.org/imagemin-optipng?rev=181-81a0d05729671b0f808d395c25ee0c71";
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
    ident = "imagemin-optipng";
    ldir  = "info/unscoped/i/imagemin-optipng";
    inherit packument fetchInfo;
  } // latest';

}
