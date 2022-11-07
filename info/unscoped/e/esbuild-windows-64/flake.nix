{

  inputs.packument.url   = "https://registry.npmjs.org/esbuild-windows-64?rev=376-1c7552a815637d65f60dd4d287a5aa67";
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
    ident = "esbuild-windows-64";
    ldir  = "info/unscoped/e/esbuild-windows-64";
    inherit packument fetchInfo;
  } // latest';

}
