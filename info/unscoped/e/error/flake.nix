{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/error?_rev=100-9c9cd49bcdfd3a61470f17aaf1e5ce61";
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
    ident = "error";
    ldir  = "info/unscoped/e/error";
    inherit packument fetchInfo;
  } // latest';

}
