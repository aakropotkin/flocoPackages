{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/tfunk?_rev=26-f1a92f4d243d7af07f099f299fbb80e5";
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
    ident = "tfunk";
    ldir  = "info/unscoped/t/tfunk";
    inherit packument fetchInfo;
  } // latest';

}
