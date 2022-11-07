{

  inputs.packument.url   = "https://registry.npmjs.org/node-opcua-packet-analyzer?rev=156-536230a0f83fa304c488c27f1644ef91";
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
    ident = "node-opcua-packet-analyzer";
    ldir  = "info/unscoped/n/node-opcua-packet-analyzer";
    inherit packument fetchInfo;
  } // latest';

}
