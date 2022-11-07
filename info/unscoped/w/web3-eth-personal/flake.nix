{

  inputs.packument.url   = "https://registry.npmjs.org/web3-eth-personal?rev=143-6c35e61ff44656b3c9cdf3fc143c8ff9";
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
    ident = "web3-eth-personal";
    ldir  = "info/unscoped/w/web3-eth-personal";
    inherit packument fetchInfo;
  } // latest';

}
