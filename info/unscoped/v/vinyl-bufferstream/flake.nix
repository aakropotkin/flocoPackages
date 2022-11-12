{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/vinyl-bufferstream?_rev=11-be504a183606f6cc48628dbd6de3a0ce";
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
    ident = "vinyl-bufferstream";
    ldir  = "info/unscoped/v/vinyl-bufferstream";
    inherit packument fetchInfo;
  } // latest';

}
