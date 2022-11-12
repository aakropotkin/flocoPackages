{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-service-call?_rev=178-0b650d89609ebb13a2678c1573f98de1";
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
    ident = "node-opcua-service-call";
    ldir  = "info/unscoped/n/node-opcua-service-call";
    inherit packument fetchInfo;
  } // latest';

}
