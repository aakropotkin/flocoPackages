{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@octokit/graphql?_rev=47-5b76fc07c6d32a5e4bd082f5694bb195";
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
    scope = "@octokit";
    ident = "@octokit/graphql";
    ldir  = "info/octokit/graphql";
    inherit packument fetchInfo;
  } // latest';

}
