{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/reselect?_rev=118-5de5a2211b01262bf02a922bb9d9ecc3";
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
    ident = "reselect";
    ldir  = "info/unscoped/r/reselect";
    inherit packument fetchInfo;
  } // latest';

}
