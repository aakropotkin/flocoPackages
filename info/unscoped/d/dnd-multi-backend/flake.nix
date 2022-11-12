{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/dnd-multi-backend?_rev=50-82f0bbd2fa4631a54f0aa8d388720936";
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
    ident = "dnd-multi-backend";
    ldir  = "info/unscoped/d/dnd-multi-backend";
    inherit packument fetchInfo;
  } // latest';

}
