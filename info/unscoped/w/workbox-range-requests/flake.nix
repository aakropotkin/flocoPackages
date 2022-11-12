{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/workbox-range-requests?_rev=94-c1a61d2821d2468bc1c10b89dfab10d2";
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
    ident = "workbox-range-requests";
    ldir  = "info/unscoped/w/workbox-range-requests";
    inherit packument fetchInfo;
  } // latest';

}
