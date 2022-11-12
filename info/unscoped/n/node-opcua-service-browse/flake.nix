{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-service-browse?_rev=179-005ee3c6347ac5cdf3514fb388ae7421";
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
    ident = "node-opcua-service-browse";
    ldir  = "info/unscoped/n/node-opcua-service-browse";
    inherit packument fetchInfo;
  } // latest';

}
