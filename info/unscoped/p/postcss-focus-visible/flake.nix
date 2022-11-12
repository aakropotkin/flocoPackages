{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/postcss-focus-visible?_rev=13-ac2c32357c048a47c5bd745fba0290d0";
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
    ident = "postcss-focus-visible";
    ldir  = "info/unscoped/p/postcss-focus-visible";
    inherit packument fetchInfo;
  } // latest';

}
