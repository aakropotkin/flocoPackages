{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/socket.io?_rev=1203-84847a0b11714fade765a26be5b1e964";
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
    ident = "socket.io";
    ldir  = "info/unscoped/s/socket.io";
    inherit packument fetchInfo;
  } // latest';

}
