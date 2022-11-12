{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/istanbul-lib-coverage?_rev=48-bd09f8ad90fcc9dd14518aefce3c4277";
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
    ident = "istanbul-lib-coverage";
    ldir  = "info/unscoped/i/istanbul-lib-coverage";
    inherit packument fetchInfo;
  } // latest';

}
