{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@azure/identity?_rev=357-136e61aeb5e0670389092b1d7731a4c0";
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
    ident = "@azure/identity";
    ldir  = "info/azure/identity";
    inherit packument fetchInfo;
  } // latest';

}
