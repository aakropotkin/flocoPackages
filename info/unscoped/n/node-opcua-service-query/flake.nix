{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-service-query?_rev=195-b5808bca60a061b2bca000960da6773b";
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
    ident = "node-opcua-service-query";
    ldir  = "info/unscoped/n/node-opcua-service-query";
    inherit packument fetchInfo;
  } // latest';

}
