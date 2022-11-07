{

  inputs.packument.url   = "https://registry.npmjs.org/socket.io-client?rev=336-f67c56c9ce4eb31e9eb78cc52f5c48c3";
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
    ident = "socket.io-client";
    ldir  = "info/unscoped/s/socket.io-client";
    inherit packument fetchInfo;
  } // latest';

}
