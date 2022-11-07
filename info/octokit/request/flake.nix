{

  inputs.packument.url   = "https://registry.npmjs.org/@octokit/request?rev=76-db5241037d3dc5034bad6ac27a42550d";
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
    ident = "@octokit/request";
    ldir  = "info/octokit/request";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
