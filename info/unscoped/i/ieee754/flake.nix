{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/ieee754?_rev=29-3102f2d11b8ed90c903756f6104b3719";
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
    ident = "ieee754";
    ldir  = "info/unscoped/i/ieee754";
    inherit packument fetchInfo;
  } // latest';

}
