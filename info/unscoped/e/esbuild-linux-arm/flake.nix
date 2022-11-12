{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/esbuild-linux-arm?_rev=187-e7e5061af19602df06ad310521ed028b";
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
    ident = "esbuild-linux-arm";
    ldir  = "info/unscoped/e/esbuild-linux-arm";
    inherit packument fetchInfo;
  } // latest';

}
