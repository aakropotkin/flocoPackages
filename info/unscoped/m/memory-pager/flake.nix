{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/memory-pager?_rev=12-dae84bda5396159a984237dceb802587";
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
    ident = "memory-pager";
    ldir  = "info/unscoped/m/memory-pager";
    inherit packument fetchInfo;
  } // latest';

}
