{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/fs-merger?_rev=25-71ed8f9e79b3eb46edcd5862d33fa410";
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
    ident = "fs-merger";
    ldir  = "info/unscoped/f/fs-merger";
    inherit packument fetchInfo;
  } // latest';

}
