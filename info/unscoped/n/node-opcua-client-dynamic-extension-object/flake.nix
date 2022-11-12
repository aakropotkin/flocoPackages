{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-client-dynamic-extension-object?_rev=148-f3371d1207edaeb139ff8ab6202dcce5";
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
    ident = "node-opcua-client-dynamic-extension-object";
    ldir  = "info/unscoped/n/node-opcua-client-dynamic-extension-object";
    inherit packument fetchInfo;
  } // latest';

}
