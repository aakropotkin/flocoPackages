{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/esbuild-linux-64?_rev=374-2cafdeadbbf30905b408eefcfefc22bc";
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
    ident = "esbuild-linux-64";
    ldir  = "info/unscoped/e/esbuild-linux-64";
    inherit packument fetchInfo;
  } // latest';

}
