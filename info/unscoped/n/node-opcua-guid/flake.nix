{

  inputs.packument.url   = "https://registry.npmjs.org/node-opcua-guid?rev=66-ad002b9e5aafb86ae713613b048c1351";
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
    ident = "node-opcua-guid";
    ldir  = "info/unscoped/n/node-opcua-guid";
    inherit packument fetchInfo;
  } // latest';

}
