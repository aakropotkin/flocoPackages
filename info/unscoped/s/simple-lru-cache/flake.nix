{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/simple-lru-cache?_rev=10-b2b7ffa986315d40d2bb742d21866a0f";
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
    ident = "simple-lru-cache";
    ldir  = "info/unscoped/s/simple-lru-cache";
    inherit packument fetchInfo;
  } // latest';

}
