{

  inputs.packument.url   = "https://registry.npmjs.org/@octokit/endpoint?rev=75-fef05c6c29fd420646e73647b8c7866a";
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
    ident = "@octokit/endpoint";
    ldir  = "info/octokit/endpoint";
    inherit packument fetchInfo;
  } // latest';

}
