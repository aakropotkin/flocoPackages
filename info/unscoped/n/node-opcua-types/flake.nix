{

  inputs.packument.url   = "https://registry.npmjs.org/node-opcua-types?rev=147-f792e220dfe5bc1ff4642e3dc67586bd";
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
    ident = "node-opcua-types";
    ldir  = "info/unscoped/n/node-opcua-types";
    inherit packument fetchInfo;
  } // latest';

}
