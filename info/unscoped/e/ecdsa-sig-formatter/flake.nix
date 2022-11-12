{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/ecdsa-sig-formatter?_rev=13-4dfcb52c160d5546f91c284def45d9a0";
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
    ident = "ecdsa-sig-formatter";
    ldir  = "info/unscoped/e/ecdsa-sig-formatter";
    inherit packument fetchInfo;
  } // latest';

}
