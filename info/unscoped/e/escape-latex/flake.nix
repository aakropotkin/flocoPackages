{

  inputs.packument.url   = "https://registry.npmjs.org/escape-latex?rev=26-d6a3d7df53f983c43a60ea5bd9dfd8fc";
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
    ident = "escape-latex";
    ldir  = "info/unscoped/e/escape-latex";
    inherit packument fetchInfo;
  } // latest';

}
