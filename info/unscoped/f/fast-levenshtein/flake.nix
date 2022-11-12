{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/fast-levenshtein?_rev=51-1033e3a974dd52383b9ef9bc2acdfd74";
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
    ident = "fast-levenshtein";
    ldir  = "info/unscoped/f/fast-levenshtein";
    inherit packument fetchInfo;
  } // latest';

}
