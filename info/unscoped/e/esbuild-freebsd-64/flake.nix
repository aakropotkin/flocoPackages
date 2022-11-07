{

  inputs.packument.url   = "https://registry.npmjs.org/esbuild-freebsd-64?rev=271-49fef018284ca1196ef795a84abde43e";
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
    ident = "esbuild-freebsd-64";
    ldir  = "info/unscoped/e/esbuild-freebsd-64";
    inherit packument fetchInfo;
  } // latest';

}
