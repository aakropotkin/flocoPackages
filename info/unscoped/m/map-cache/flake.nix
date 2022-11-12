{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/map-cache?_rev=10-3ae9d1ae090db3e6b242178fc51aad3a";
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
    ident = "map-cache";
    ldir  = "info/unscoped/m/map-cache";
    inherit packument fetchInfo;
  } // latest';

}
