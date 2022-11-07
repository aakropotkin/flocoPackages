{

  inputs.packument.url   = "https://registry.npmjs.org/@octokit/rest?rev=315-0c9ad23323e5be50218fcfbf17a292d2";
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
    ident = "@octokit/rest";
    ldir  = "info/octokit/rest";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
