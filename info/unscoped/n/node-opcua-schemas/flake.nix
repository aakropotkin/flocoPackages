{

  inputs.packument.url   = "https://registry.npmjs.org/node-opcua-schemas?rev=175-f6f21b0c4503182dce34f5c9caaef13a";
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
    ident = "node-opcua-schemas";
    ldir  = "info/unscoped/n/node-opcua-schemas";
    inherit packument fetchInfo;
  } // latest';

}
