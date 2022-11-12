{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-service-secure-channel?_rev=178-8a331f58f1a3fc54eeaf72edc3f36f1f";
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
    ident = "node-opcua-service-secure-channel";
    ldir  = "info/unscoped/n/node-opcua-service-secure-channel";
    inherit packument fetchInfo;
  } // latest';

}
