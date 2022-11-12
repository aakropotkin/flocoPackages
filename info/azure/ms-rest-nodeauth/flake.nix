{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@azure/ms-rest-nodeauth?_rev=39-34bac53342927b1807aab024e4d503fe";
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
    ident = "@azure/ms-rest-nodeauth";
    ldir  = "info/azure/ms-rest-nodeauth";
    inherit packument fetchInfo;
  } // latest';

}
