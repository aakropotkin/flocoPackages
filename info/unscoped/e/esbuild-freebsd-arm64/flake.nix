{

  inputs.packument.url   = "https://registry.npmjs.org/esbuild-freebsd-arm64?rev=272-9bff66c76f4fb70c04ca9043a568af13";
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
    ident = "esbuild-freebsd-arm64";
    ldir  = "info/unscoped/e/esbuild-freebsd-arm64";
    inherit packument fetchInfo;
  } // latest';

}
