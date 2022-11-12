{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/eth-lib?_rev=41-33a3a92766cb822b6112d8c29851a6c4";
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
    ident = "eth-lib";
    ldir  = "info/unscoped/e/eth-lib";
    inherit packument fetchInfo;
  } // latest';

}
