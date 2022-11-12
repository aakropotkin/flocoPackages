{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@ethersproject/abstract-signer?_rev=54-89d69808615dfb0daad86a3a8e3428e1";
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
    scope = "@ethersproject";
    ident = "@ethersproject/abstract-signer";
    ldir  = "info/ethersproject/abstract-signer";
    inherit packument fetchInfo;
  } // latest';

}
