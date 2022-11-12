{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-opcua-numeric-range?_rev=158-ba595ce71234d19e9e482733bc0619ff";
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
    ident = "node-opcua-numeric-range";
    ldir  = "info/unscoped/n/node-opcua-numeric-range";
    inherit packument fetchInfo;
  } // latest';

}
