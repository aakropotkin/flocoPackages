{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/jsbi?_rev=31-d8f047de0deef1c74ed414c0bd8c3863";
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
    ident = "jsbi";
    ldir  = "info/unscoped/j/jsbi";
    inherit packument fetchInfo;
  } // latest';

}
