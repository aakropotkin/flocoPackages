{

  inputs.packument.url   = "https://registry.npmjs.org/node-opcua-data-value?rev=173-0981230093472047a947d54b14b38fef";
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
    ident = "node-opcua-data-value";
    ldir  = "info/unscoped/n/node-opcua-data-value";
    inherit packument fetchInfo;
  } // latest';

}
