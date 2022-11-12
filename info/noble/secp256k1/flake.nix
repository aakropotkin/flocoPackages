{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@noble%2fsecp256k1?_rev=18-c5e7974bea4170063a8d3bab51d27dd9";
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
    scope = "@noble";
    ident = "@noble/secp256k1";
    ldir  = "info/noble/secp256k1";
    inherit packument fetchInfo;
  } // latest';

}
