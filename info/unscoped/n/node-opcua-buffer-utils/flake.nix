{

  inputs.packument.url   = "https://registry.npmjs.org/node-opcua-buffer-utils";
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
    ident = "node-opcua-buffer-utils";
    ldir  = "info/unscoped/n/node-opcua-buffer-utils";
    inherit packument fetchInfo;
  } // latest';

}
