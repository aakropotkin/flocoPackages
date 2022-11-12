{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-binary-stream?_rev=100-c54f72cd3bad8d22b0ea53542f91089f";
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
    ident = "node-opcua-binary-stream";
    ldir  = "info/unscoped/n/node-opcua-binary-stream";
    inherit packument fetchInfo;
  } // latest';

}
