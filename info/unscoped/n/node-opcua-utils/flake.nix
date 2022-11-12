{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-utils?_rev=118-e4c34acf1abd8d2e414a9ca6992d0423";
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
    ident = "node-opcua-utils";
    ldir  = "info/unscoped/n/node-opcua-utils";
    inherit packument fetchInfo;
  } // latest';

}
