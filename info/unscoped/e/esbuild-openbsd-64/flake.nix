{

  inputs.packument.url   = "https://registry.npmjs.org/esbuild-openbsd-64?rev=122-863b3f79c0bc5f43cafb9fa406f0e610";
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
    ident = "esbuild-openbsd-64";
    ldir  = "info/unscoped/e/esbuild-openbsd-64";
    inherit packument fetchInfo;
  } // latest';

}
