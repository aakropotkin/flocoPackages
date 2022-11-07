{

  inputs.packument.url   = "https://registry.npmjs.org/@azure/ms-rest-azure-env?rev=7-f2fa216f7faba7317b1d7bc5f50caad2";
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
    ident = "@azure/ms-rest-azure-env";
    ldir  = "info/azure/ms-rest-azure-env";
    inherit packument fetchInfo;
  } // latest';

}
