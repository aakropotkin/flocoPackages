{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/js-sha3?_rev=26-00c526e192fe3b6197cade5779a8b8f8";
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
    ident = "js-sha3";
    ldir  = "info/unscoped/j/js-sha3";
    inherit packument fetchInfo;
  } // latest';

}
