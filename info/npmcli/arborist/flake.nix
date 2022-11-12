{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@npmcli%2farborist?_rev=174-dd7fef0a7754fef474023e36ad05fe00";
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
    scope = "@npmcli";
    ident = "@npmcli/arborist";
    ldir  = "info/npmcli/arborist";
    inherit packument fetchInfo;
  } // latest';

}
