{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/etag?_rev=50-28e5bd29021b6523176513af28ba9f9f";
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
    ident = "etag";
    ldir  = "info/unscoped/e/etag";
    inherit packument fetchInfo;
  } // latest';

}
