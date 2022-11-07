{

  inputs.packument.url   = "https://registry.npmjs.org/@azure/logger?rev=124-68f2027af5193332f51d14233b2ccffd";
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
    ident = "@azure/logger";
    ldir  = "info/azure/logger";
    inherit packument fetchInfo;
  } // latest';

}
