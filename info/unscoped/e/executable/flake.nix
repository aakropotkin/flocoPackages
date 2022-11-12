{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/executable?_rev=36-3c9cf9159834e821f22ec3276932fef7";
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
    ident = "executable";
    ldir  = "info/unscoped/e/executable";
    inherit packument fetchInfo;
  } // latest';

}
