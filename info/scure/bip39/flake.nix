{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@scure/bip39?_rev=3-915c4d8d0e0a0c1351025e2070b897ee";
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
    scope = "@scure";
    ident = "@scure/bip39";
    ldir  = "info/scure/bip39";
    inherit packument fetchInfo;
  } // latest';

}
