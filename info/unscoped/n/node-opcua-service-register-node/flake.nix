{

  inputs.packument.url   = "https://registry.npmjs.org/node-opcua-service-register-node?rev=178-d58f6b00308676dd27d2ce4b10e5d68d";
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
    ident = "node-opcua-service-register-node";
    ldir  = "info/unscoped/n/node-opcua-service-register-node";
    inherit packument fetchInfo;
  } // latest';

}
