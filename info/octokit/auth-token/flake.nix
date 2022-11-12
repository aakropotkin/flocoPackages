{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@octokit%2fauth-token?_rev=22-3632d3dd3e66e28ba53b817010ce46b9";
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
    ident = "@octokit/auth-token";
    ldir  = "info/octokit/auth-token";
    inherit packument fetchInfo;
  } // latest';

}
