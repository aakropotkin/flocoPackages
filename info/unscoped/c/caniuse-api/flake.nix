{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/caniuse-api?_rev=38-1d13e304f3dfd0bfbbb2e81e2d84b1cd";
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
    ident = "caniuse-api";
    ldir  = "info/unscoped/c/caniuse-api";
    inherit packument fetchInfo;
  } // latest';

}
