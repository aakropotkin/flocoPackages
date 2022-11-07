{

  inputs.packument.url   = "https://registry.npmjs.org/@octokit/types?rev=172-f4d67004e8be836bf3aa4a4b990b7f10";
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
    ident = "@octokit/types";
    ldir  = "info/octokit/types";
    inherit packument fetchInfo;
  } // latest';

}
