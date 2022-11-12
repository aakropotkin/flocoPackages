{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@ethersproject%2fsigning-key?_rev=45-eedc0dde3e951df5adeaa006aba7ab9b";
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
    ident = "@ethersproject/signing-key";
    ldir  = "info/ethersproject/signing-key";
    inherit packument fetchInfo;
  } // latest';

}
