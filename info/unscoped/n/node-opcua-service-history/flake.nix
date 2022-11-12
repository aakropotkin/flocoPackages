{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-service-history?_rev=179-f9da8131992db8ac669ac0eb9e88a905";
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
    ident = "node-opcua-service-history";
    ldir  = "info/unscoped/n/node-opcua-service-history";
    inherit packument fetchInfo;
  } // latest';

}
