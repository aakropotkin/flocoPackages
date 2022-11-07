{

  inputs.packument.url   = "https://registry.npmjs.org/node-opcua-service-session?rev=178-32fa172ca3eec107203fe4f9752465fb";
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
    ident = "node-opcua-service-session";
    ldir  = "info/unscoped/n/node-opcua-service-session";
    inherit packument fetchInfo;
  } // latest';

}
