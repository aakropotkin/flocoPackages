{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-service-subscription?_rev=195-61e7e6045c1704a73add11bcba471e4e";
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
    ident = "node-opcua-service-subscription";
    ldir  = "info/unscoped/n/node-opcua-service-subscription";
    inherit packument fetchInfo;
  } // latest';

}
