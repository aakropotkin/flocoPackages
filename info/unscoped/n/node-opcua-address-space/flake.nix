{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-address-space?_rev=226-6b2511023d34e5e969d59566e183fc9b";
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
    ident = "node-opcua-address-space";
    ldir  = "info/unscoped/n/node-opcua-address-space";
    inherit packument fetchInfo;
  } // latest';

}
