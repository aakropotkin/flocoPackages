{

  inputs.packument.url   = "https://registry.npmjs.org/strip-hex-prefix?rev=3-85edc78d0978aa7a2fab5f8aaf54e29c";
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
    ident = "strip-hex-prefix";
    ldir  = "info/unscoped/s/strip-hex-prefix";
    inherit packument fetchInfo;
  } // latest';

}
