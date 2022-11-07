{

  inputs.packument.url   = "https://registry.npmjs.org/node-opcua-secure-channel?rev=195-6473fe55948b9c8bbac6fe69d1629eef";
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
    ident = "node-opcua-secure-channel";
    ldir  = "info/unscoped/n/node-opcua-secure-channel";
    inherit packument fetchInfo;
  } // latest';

}
