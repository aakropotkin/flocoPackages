{

  inputs.packument.url   = "https://registry.npmjs.org/@kwsites/promise-deferred?rev=6-84c17019a0f65101198bffe850666746";
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
    scope = "@kwsites";
    ident = "@kwsites/promise-deferred";
    ldir  = "info/kwsites/promise-deferred";
    inherit packument fetchInfo;
  } // latest';

}
