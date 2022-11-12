{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/fast-printf?_rev=31-e177e453977864269ea8431d00760f33";
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
    ident = "fast-printf";
    ldir  = "info/unscoped/f/fast-printf";
    inherit packument fetchInfo;
  } // latest';

}
