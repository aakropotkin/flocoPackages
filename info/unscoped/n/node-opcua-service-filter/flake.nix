{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-service-filter?_rev=180-21253d09766a05dc0a0c7b17c455eb61";
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
    ident = "node-opcua-service-filter";
    ldir  = "info/unscoped/n/node-opcua-service-filter";
    inherit packument fetchInfo;
  } // latest';

}
