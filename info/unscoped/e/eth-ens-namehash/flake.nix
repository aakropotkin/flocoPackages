{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/eth-ens-namehash?_rev=14-a98e5579581d2a96ce13cd605c40fd84";
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
    ident = "eth-ens-namehash";
    ldir  = "info/unscoped/e/eth-ens-namehash";
    inherit packument fetchInfo;
  } // latest';

}
