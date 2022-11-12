{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@azure%2fcore-util?_rev=40-4ad378c4ca877ce9deed49bdeaf61e2b";
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
    ident = "@azure/core-util";
    ldir  = "info/azure/core-util";
    inherit packument fetchInfo;
  } // latest';

}
