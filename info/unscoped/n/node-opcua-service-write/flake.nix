{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-service-write?_rev=178-2d1a59a2e7ae571341a0f918905354a4";
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
    ident = "node-opcua-service-write";
    ldir  = "info/unscoped/n/node-opcua-service-write";
    inherit packument fetchInfo;
  } // latest';

}
