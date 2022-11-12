{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/fs-updater?_rev=8-eb124e67cbf2b90965aa2fddbd587f26";
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
    ident = "fs-updater";
    ldir  = "info/unscoped/f/fs-updater";
    inherit packument fetchInfo;
  } // latest';

}
