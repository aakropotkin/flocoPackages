{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/sort-keys-length?_rev=9-9b77bb9e5af17b342fa191accd71d9c8";
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
    ident = "sort-keys-length";
    ldir  = "info/unscoped/s/sort-keys-length";
    inherit packument fetchInfo;
  } // latest';

}
