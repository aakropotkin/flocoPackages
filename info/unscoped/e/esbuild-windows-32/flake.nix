{

  inputs.packument.url   = "https://registry.npmjs.org/esbuild-windows-32?rev=259-8c4a5c547de9fff36998f7bc4fb522e1";
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
    ident = "esbuild-windows-32";
    ldir  = "info/unscoped/e/esbuild-windows-32";
    inherit packument fetchInfo;
  } // latest';

}
