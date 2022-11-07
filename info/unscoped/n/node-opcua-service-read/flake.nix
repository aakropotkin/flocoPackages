{

  inputs.packument.url   = "https://registry.npmjs.org/node-opcua-service-read?rev=178-1a26047c12dd979218a828090c30e7b3";
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
    ident = "node-opcua-service-read";
    ldir  = "info/unscoped/n/node-opcua-service-read";
    inherit packument fetchInfo;
  } // latest';

}
