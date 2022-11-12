{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/accepts?_rev=95-46953e0b93ceebb50c1e9ddec8ce6d31";
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
    ident = "accepts";
    ldir  = "info/unscoped/a/accepts";
    inherit packument fetchInfo;
  } // latest';

}
