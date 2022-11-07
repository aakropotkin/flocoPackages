{

  inputs.packument.url   = "https://registry.npmjs.org/esbuild-sunos-64?rev=91-8437bc538d1e3289b498e7db0d63f681";
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
    ident = "esbuild-sunos-64";
    ldir  = "info/unscoped/e/esbuild-sunos-64";
    inherit packument fetchInfo;
  } // latest';

}
