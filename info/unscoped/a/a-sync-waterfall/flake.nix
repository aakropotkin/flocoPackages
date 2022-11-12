{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/a-sync-waterfall?_rev=5-2be4c6e45a6ab02b7d50d46d3c5c5b7f";
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
    ident = "a-sync-waterfall";
    ldir  = "info/unscoped/a/a-sync-waterfall";
    inherit packument fetchInfo;
  } // latest';

}
