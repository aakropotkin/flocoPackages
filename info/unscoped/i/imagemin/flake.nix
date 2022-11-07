{

  inputs.packument.url   = "https://registry.npmjs.org/imagemin?rev=376-348d0b2d1cf0431207c48c810a46028b";
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
    ident = "imagemin";
    ldir  = "info/unscoped/i/imagemin";
    inherit packument fetchInfo;
  } // latest';

}
