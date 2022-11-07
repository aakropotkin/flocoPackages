{

  inputs.packument.url   = "https://registry.npmjs.org/node-opcua-client?rev=233-e131318caef7a329aa92e29a21cbdcce";
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
    ident = "node-opcua-client";
    ldir  = "info/unscoped/n/node-opcua-client";
    inherit packument fetchInfo;
  } // latest';

}
