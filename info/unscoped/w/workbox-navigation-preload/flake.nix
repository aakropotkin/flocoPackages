{

  inputs.packument.url   = "https://registry.npmjs.org/workbox-navigation-preload";
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
    ident = "workbox-navigation-preload";
    ldir  = "info/unscoped/w/workbox-navigation-preload";
    inherit packument fetchInfo;
  } // latest';

}
