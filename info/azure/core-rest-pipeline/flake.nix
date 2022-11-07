{

  inputs.packument.url   = "https://registry.npmjs.org/@azure/core-rest-pipeline?rev=112-9a175756620831f5153e03a7befa45cb";
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
    ident = "@azure/core-rest-pipeline";
    ldir  = "info/azure/core-rest-pipeline";
    inherit packument fetchInfo;
  } // latest';

}
