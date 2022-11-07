{

  inputs.packument.url   = "https://registry.npmjs.org/node-opcua-service-node-management?rev=178-23c744bb520b34365fbac832bd5d18b7";
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
    ident = "node-opcua-service-node-management";
    ldir  = "info/unscoped/n/node-opcua-service-node-management";
    inherit packument fetchInfo;
  } // latest';

}
