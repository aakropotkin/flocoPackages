{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@azure/core-auth?_rev=153-acf2e63d53c004f4292dbf593be77f23";
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
    scope = "@azure";
    ident = "@azure/core-auth";
    ldir  = "info/azure/core-auth";
    inherit packument fetchInfo;
  } // latest';

}
