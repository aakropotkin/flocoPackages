{

  inputs.packument.url   = "https://registry.npmjs.org/esbuild-linux-riscv64";
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
    ident = "esbuild-linux-riscv64";
    ldir  = "info/unscoped/e/esbuild-linux-riscv64";
    inherit packument fetchInfo;
  } // latest';

}
