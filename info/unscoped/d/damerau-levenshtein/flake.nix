{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/damerau-levenshtein?_rev=19-a3586d5250760542e2fdec31cf96cc35";
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
    ident = "damerau-levenshtein";
    ldir  = "info/unscoped/d/damerau-levenshtein";
    inherit packument fetchInfo;
  } // latest';

}
