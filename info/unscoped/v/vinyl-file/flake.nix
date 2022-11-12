{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/vinyl-file?_rev=21-16b11f617ebc1d046b55bff2030d7da8";
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
    ident = "vinyl-file";
    ldir  = "info/unscoped/v/vinyl-file";
    inherit packument fetchInfo;
  } // latest';

}
