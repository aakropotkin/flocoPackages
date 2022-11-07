{

  inputs.packument.url   = "https://registry.npmjs.org/node-opcua-address-space-for-conformance-testing?rev=225-4efc6b0912221303843c2a1a6a53916c";
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
    ident = "node-opcua-address-space-for-conformance-testing";
    ldir  = "info/unscoped/n/node-opcua-address-space-for-conformance-testing";
    inherit packument fetchInfo;
  } // latest';

}
