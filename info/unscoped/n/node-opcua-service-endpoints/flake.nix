{

  inputs.packument.url   = "https://registry.npmjs.org/node-opcua-service-endpoints?rev=178-3ff0c81ff690cb4cadd41e0a45afe1d0";
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
    ident = "node-opcua-service-endpoints";
    ldir  = "info/unscoped/n/node-opcua-service-endpoints";
    inherit packument fetchInfo;
  } // latest';

}
