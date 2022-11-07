{

  inputs.packument.url   = "https://registry.npmjs.org/socket.io-parser?rev=83-b703a0e668b3e2178aea321db7ae677b";
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
    ident = "socket.io-parser";
    ldir  = "info/unscoped/s/socket.io-parser";
    inherit packument fetchInfo;
  } // latest';

}
