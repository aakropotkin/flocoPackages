{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/random-bytes?_rev=7-7d0f4f360be4898ea9106a6114113057";
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
    ident = "random-bytes";
    ldir  = "info/unscoped/r/random-bytes";
    inherit packument fetchInfo;
  } // latest';

}
