{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@octokit/plugin-request-log?_rev=8-39a9672b4abf49966e5f81be9e1cb58c";
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
    ident = "@octokit/plugin-request-log";
    ldir  = "info/octokit/plugin-request-log";
    inherit packument fetchInfo;
  } // latest';

}
