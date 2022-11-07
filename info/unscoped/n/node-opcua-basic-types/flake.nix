{

  inputs.packument.url   = "https://registry.npmjs.org/node-opcua-basic-types?rev=145-801f4d6fa1676690a83df595d8922fa4";
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
    ident = "node-opcua-basic-types";
    ldir  = "info/unscoped/n/node-opcua-basic-types";
    inherit packument fetchInfo;
  } // latest';

}
