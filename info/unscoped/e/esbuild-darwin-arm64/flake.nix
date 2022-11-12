{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/esbuild-darwin-arm64?_rev=164-f518296a9105ed74741d8437ca31c3d9";
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
    ident = "esbuild-darwin-arm64";
    ldir  = "info/unscoped/e/esbuild-darwin-arm64";
    inherit packument fetchInfo;
  } // latest';

}
