{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/raf?_rev=76-46b2c80f511adc7c095563e29056f0ac";
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
    ident = "raf";
    ldir  = "info/unscoped/r/raf";
    inherit packument fetchInfo;
  } // latest';

}
