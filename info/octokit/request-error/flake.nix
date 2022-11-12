{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@octokit/request-error?_rev=24-8fb226eb8425aea30c1cdc49067b58ff";
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
    ident = "@octokit/request-error";
    ldir  = "info/octokit/request-error";
    inherit packument fetchInfo;
  } // latest';

}
