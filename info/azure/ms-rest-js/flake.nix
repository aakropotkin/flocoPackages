{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@azure%2fms-rest-js?_rev=81-4d174d33d647ee3cd4094a1f8db794e0";
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
    ident = "@azure/ms-rest-js";
    ldir  = "info/azure/ms-rest-js";
    inherit packument fetchInfo;
  } // latest';

}
