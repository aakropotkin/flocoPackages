{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@serialport%2fbindings-interface?_rev=5-4e0621b149819ed3f6f6f19d3ba2e300";
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
    scope = "@serialport";
    ident = "@serialport/bindings-interface";
    ldir  = "info/serialport/bindings-interface";
    inherit packument fetchInfo;
  } // latest';

}
