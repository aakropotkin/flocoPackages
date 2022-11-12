{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@azure/core-http-compat?_rev=24-aafa5b89e8a8e34eacbe20a30de56af1";
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
    ident = "@azure/core-http-compat";
    ldir  = "info/azure/core-http-compat";
    inherit packument fetchInfo;
  } // latest';

}
