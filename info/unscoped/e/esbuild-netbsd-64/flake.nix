{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/esbuild-netbsd-64?_rev=80-4bb1784b4cbe39982b40228e7ad9e88b";
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
    ident = "esbuild-netbsd-64";
    ldir  = "info/unscoped/e/esbuild-netbsd-64";
    inherit packument fetchInfo;
  } // latest';

}
