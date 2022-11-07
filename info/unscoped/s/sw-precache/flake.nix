{

  inputs.packument.url   = "https://registry.npmjs.org/sw-precache?rev=76-0bc9db2263f11f165a945ff3f2d10719";
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
    ident = "sw-precache";
    ldir  = "info/unscoped/s/sw-precache";
    inherit packument fetchInfo;
  } // latest';

}
