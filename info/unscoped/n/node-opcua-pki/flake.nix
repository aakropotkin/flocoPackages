{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-pki?_rev=109-f7aab8c211c96f7715ffaf13b2d077b9";
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
    ident = "node-opcua-pki";
    ldir  = "info/unscoped/n/node-opcua-pki";
    inherit packument fetchInfo;
  } // latest';

}
