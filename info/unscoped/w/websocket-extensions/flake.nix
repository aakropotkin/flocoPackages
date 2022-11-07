{

  inputs.packument.url   = "https://registry.npmjs.org/websocket-extensions?rev=12-e71799dca4093dca0c9b13cfdcf44990";
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
    ident = "websocket-extensions";
    ldir  = "info/unscoped/w/websocket-extensions";
    inherit packument fetchInfo;
  } // latest';

}
