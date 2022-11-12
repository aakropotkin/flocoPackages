{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-constants?_rev=56-cad91443d0384e5ab1e3ed92ad37ec6d";
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
    ident = "node-opcua-constants";
    ldir  = "info/unscoped/n/node-opcua-constants";
    inherit packument fetchInfo;
  } // latest';

}
