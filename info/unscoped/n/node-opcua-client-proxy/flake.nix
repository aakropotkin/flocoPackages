{

  inputs.packument.url   = "https://registry.npmjs.org/node-opcua-client-proxy?rev=225-205e384b170dd4c4b9bbc3d2b59dfa17";
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
    ident = "node-opcua-client-proxy";
    ldir  = "info/unscoped/n/node-opcua-client-proxy";
    inherit packument fetchInfo;
  } // latest';

}
