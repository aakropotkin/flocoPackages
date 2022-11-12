{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/rc-slider?_rev=199-9c6df6aa84a33c904577609a1ea2ef79";
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
    ident = "rc-slider";
    ldir  = "info/unscoped/r/rc-slider";
    inherit packument fetchInfo;
  } // latest';

}
