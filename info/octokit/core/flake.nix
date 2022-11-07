{

  inputs.packument.url   = "https://registry.npmjs.org/@octokit/core?rev=52-94d61cb1cd165beecf00ad82d76ee8e8";
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
    ident = "@octokit/core";
    ldir  = "info/octokit/core";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
