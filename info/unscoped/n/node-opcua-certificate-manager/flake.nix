{

  inputs.packument.url   = "https://registry.npmjs.org/node-opcua-certificate-manager?rev=133-57bafc941864408dd410f3fa9d052375";
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
    ident = "node-opcua-certificate-manager";
    ldir  = "info/unscoped/n/node-opcua-certificate-manager";
    inherit packument fetchInfo;
  } // latest';

}
