{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/pause?_rev=15-fe144e66c137ff9b0d081072a5ef58a5";
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
    ident = "pause";
    ldir  = "info/unscoped/p/pause";
    inherit packument fetchInfo;
  } // latest';

}
