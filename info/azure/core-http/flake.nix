{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@azure/core-http?_rev=282-781f4904dc2ea70c379052373442d789";
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
    ident = "@azure/core-http";
    ldir  = "info/azure/core-http";
    inherit packument fetchInfo;
  } // latest';

}
