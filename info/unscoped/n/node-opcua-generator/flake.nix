{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-generator?_rev=177-de5b35a9c807394648630a9d168e8584";
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
    ident = "node-opcua-generator";
    ldir  = "info/unscoped/n/node-opcua-generator";
    inherit packument fetchInfo;
  } // latest';

}
