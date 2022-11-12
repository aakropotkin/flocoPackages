{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-packet-assembler?_rev=69-1746a30b8cd6a1ffd015518435ef268f";
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
    ident = "node-opcua-packet-assembler";
    ldir  = "info/unscoped/n/node-opcua-packet-assembler";
    inherit packument fetchInfo;
  } // latest';

}
