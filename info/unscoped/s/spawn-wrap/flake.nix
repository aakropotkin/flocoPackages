{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/spawn-wrap?_rev=48-3ed1edcd458406eda04280b9edd608d2";
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
    ident = "spawn-wrap";
    ldir  = "info/unscoped/s/spawn-wrap";
    inherit packument fetchInfo;
  } // latest';

}
