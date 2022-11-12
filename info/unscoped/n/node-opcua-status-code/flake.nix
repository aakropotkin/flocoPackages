{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-status-code?_rev=109-d761744918153c73f54141d1a0a05df3";
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
    ident = "node-opcua-status-code";
    ldir  = "info/unscoped/n/node-opcua-status-code";
    inherit packument fetchInfo;
  } // latest';

}
