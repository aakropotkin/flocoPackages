{

  inputs.packument.url   = "https://registry.npmjs.org/esbuild-linux-ppc64le?rev=306-5ded2aefef46ac6a7b415c6081d268d4";
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
    ident = "esbuild-linux-ppc64le";
    ldir  = "info/unscoped/e/esbuild-linux-ppc64le";
    inherit packument fetchInfo;
  } // latest';

}
