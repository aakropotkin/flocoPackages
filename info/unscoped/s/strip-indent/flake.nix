{

  inputs.packument.url   = "https://registry.npmjs.org/strip-indent?rev=20-1142e4bd2314c2f55c95ac2e57cf9d11";
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
    ident = "strip-indent";
    ldir  = "info/unscoped/s/strip-indent";
    inherit packument fetchInfo;
  } // latest';

}
