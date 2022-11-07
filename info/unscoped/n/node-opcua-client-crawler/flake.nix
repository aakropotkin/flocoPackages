{

  inputs.packument.url   = "https://registry.npmjs.org/node-opcua-client-crawler?rev=240-c2682eb530cc2c5f1e84ce12480e59f0";
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
    ident = "node-opcua-client-crawler";
    ldir  = "info/unscoped/n/node-opcua-client-crawler";
    inherit packument fetchInfo;
  } // latest';

}
