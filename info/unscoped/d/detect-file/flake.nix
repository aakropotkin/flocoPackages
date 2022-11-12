{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/detect-file?_rev=7-3f1b5f771dca135893d1062ca310ff00";
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
    ident = "detect-file";
    ldir  = "info/unscoped/d/detect-file";
    inherit packument fetchInfo;
  } // latest';

}
