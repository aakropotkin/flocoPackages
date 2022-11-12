{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-data-access?_rev=178-8039a68056477be6bac562ad0c522c82";
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
    ident = "node-opcua-data-access";
    ldir  = "info/unscoped/n/node-opcua-data-access";
    inherit packument fetchInfo;
  } // latest';

}
