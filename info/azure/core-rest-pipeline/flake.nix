{

  inputs.packument.url   = "https://registry.npmjs.org/@azure/core-rest-pipeline?rev=111-4787c1597273f77800f23ce82fc6055e";
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
