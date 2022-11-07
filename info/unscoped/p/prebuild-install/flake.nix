{

  inputs.packument.url   = "https://registry.npmjs.org/prebuild-install?rev=56-96827678de36c1603f5b6891f6bfb5de";
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
    ident = "prebuild-install";
    ldir  = "info/unscoped/p/prebuild-install";
    inherit packument fetchInfo;
  } // latest';

}
