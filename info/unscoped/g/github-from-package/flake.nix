{

  inputs.packument.url   = "https://registry.npmjs.org/github-from-package?rev=6-db14cfca1cf0dd1b4754665b93fc9361";
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
    scope = null;
    ident = "github-from-package";
    ldir  = "info/unscoped/g/github-from-package";
    inherit packument fetchInfo;
  } // latest';

}
