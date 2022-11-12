{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@octokit%2fplugin-paginate-rest?_rev=84-92ff9f8f479b1de79c38338d14d23f6b";
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
    ident = "@octokit/plugin-paginate-rest";
    ldir  = "info/octokit/plugin-paginate-rest";
    inherit packument fetchInfo;
  } // latest';

}
