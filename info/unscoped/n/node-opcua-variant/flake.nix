{

  inputs.packument.url   = "https://registry.npmjs.org/node-opcua-variant?rev=168-6eab1f58270d1a9f3bb95b0d7b88f1ef";
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
    ident = "node-opcua-variant";
    ldir  = "info/unscoped/n/node-opcua-variant";
    inherit packument fetchInfo;
  } // latest';

}
