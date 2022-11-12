{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-extension-object?_rev=155-859f34200a7663f578b6a879af55a35b";
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
    ident = "node-opcua-extension-object";
    ldir  = "info/unscoped/n/node-opcua-extension-object";
    inherit packument fetchInfo;
  } // latest';

}
