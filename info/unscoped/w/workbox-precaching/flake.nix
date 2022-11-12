{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/workbox-precaching?_rev=103-c4d8673b03b8067d7de306dc71abdacd";
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
    ident = "workbox-precaching";
    ldir  = "info/unscoped/w/workbox-precaching";
    inherit packument fetchInfo;
  } // latest';

}
