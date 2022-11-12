{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/number-allocator?_rev=15-a69e45a156d849ba2e68fd3db89cd348";
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
    ident = "number-allocator";
    ldir  = "info/unscoped/n/number-allocator";
    inherit packument fetchInfo;
  } // latest';

}
