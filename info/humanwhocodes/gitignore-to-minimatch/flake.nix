{

  inputs.packument.url   = "https://registry.npmjs.org/@humanwhocodes/gitignore-to-minimatch?rev=3-322cfd44bec047489e1b90b47c63149b";
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
    scope = "@humanwhocodes";
    ident = "@humanwhocodes/gitignore-to-minimatch";
    ldir  = "info/humanwhocodes/gitignore-to-minimatch";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
