{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-object-registry?_rev=106-cc64bf6a83f03f3491fe54d96e587251";
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
    ident = "node-opcua-object-registry";
    ldir  = "info/unscoped/n/node-opcua-object-registry";
    inherit packument fetchInfo;
  } // latest';

}
