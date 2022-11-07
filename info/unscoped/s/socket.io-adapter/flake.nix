{

  inputs.packument.url   = "https://registry.npmjs.org/socket.io-adapter?rev=37-b60201210457235bf30985c38057bbb7";
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
    ident = "socket.io-adapter";
    ldir  = "info/unscoped/s/socket.io-adapter";
    inherit packument fetchInfo;
  } // latest';

}
