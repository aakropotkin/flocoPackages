{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@azure%2fcore-tracing?_rev=151-fa5184a11ad32477610a7408cdc7159e";
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
    ident = "@azure/core-tracing";
    ldir  = "info/azure/core-tracing";
    inherit packument fetchInfo;
  } // latest';

}
