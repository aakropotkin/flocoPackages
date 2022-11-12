{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/esbuild-darwin-64?_rev=376-83ddebd1ccfa7caf240337bd62335197";
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
    ident = "esbuild-darwin-64";
    ldir  = "info/unscoped/e/esbuild-darwin-64";
    inherit packument fetchInfo;
  } // latest';

}
