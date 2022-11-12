{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@npmcli%2fci-detect?_rev=26-b67c4c956c3febb7b55abcae21186741";
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
    ident = "@npmcli/ci-detect";
    ldir  = "info/npmcli/ci-detect";
    inherit packument fetchInfo;
  } // latest';

}
