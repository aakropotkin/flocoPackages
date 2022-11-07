{

  inputs.packument.url   = "https://registry.npmjs.org/web3-eth-ens?rev=107-1ae841c2ef4e50b0174e5b7fc9ea2f40";
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
    ident = "web3-eth-ens";
    ldir  = "info/unscoped/w/web3-eth-ens";
    inherit packument fetchInfo;
  } // latest';

}
