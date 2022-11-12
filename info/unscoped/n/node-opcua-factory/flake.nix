{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-factory?_rev=155-c185fb035f0c5bbfec75f9a491fd422f";
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
    ident = "node-opcua-factory";
    ldir  = "info/unscoped/n/node-opcua-factory";
    inherit packument fetchInfo;
  } // latest';

}
