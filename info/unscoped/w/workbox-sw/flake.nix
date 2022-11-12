{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/workbox-sw?_rev=113-12db5646990fba4ccc7bef6a24193ca1";
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
    ident = "workbox-sw";
    ldir  = "info/unscoped/w/workbox-sw";
    inherit packument fetchInfo;
  } // latest';

}
