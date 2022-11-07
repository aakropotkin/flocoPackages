{

  inputs.packument.url   = "https://registry.npmjs.org/workbox-background-sync?rev=105-a55e41e06dbbe9923414cc70197dc9a1";
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
    ident = "workbox-background-sync";
    ldir  = "info/unscoped/w/workbox-background-sync";
    inherit packument fetchInfo;
  } // latest';

}
