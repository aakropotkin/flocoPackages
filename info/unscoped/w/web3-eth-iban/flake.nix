{

  inputs.packument.url   = "https://registry.npmjs.org/web3-eth-iban";
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
    ident = "web3-eth-iban";
    ldir  = "info/unscoped/w/web3-eth-iban";
    inherit packument fetchInfo;
  } // latest';

}
