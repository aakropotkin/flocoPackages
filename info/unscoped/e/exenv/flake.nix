{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/exenv?_rev=16-6048f614d25bcefee6510e63e6bb22ac";
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
    ident = "exenv";
    ldir  = "info/unscoped/e/exenv";
    inherit packument fetchInfo;
  } // latest';

}
