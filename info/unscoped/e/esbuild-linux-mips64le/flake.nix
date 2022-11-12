{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/esbuild-linux-mips64le?_rev=200-4192d3bff2705be723a8ee474755d6a4";
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
    ident = "esbuild-linux-mips64le";
    ldir  = "info/unscoped/e/esbuild-linux-mips64le";
    inherit packument fetchInfo;
  } // latest';

}
