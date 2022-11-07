{

  inputs.packument.url   = "https://registry.npmjs.org/esbuild-windows-arm64?rev=96-960bf76aafe4da4402e93755e334a2f9";
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
    ident = "esbuild-windows-arm64";
    ldir  = "info/unscoped/e/esbuild-windows-arm64";
    inherit packument fetchInfo;
  } // latest';

}
