{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@ethersproject/rlp?_rev=39-00127d264199492dd9f3e0edbf240a6a";
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
    ident = "@ethersproject/rlp";
    ldir  = "info/ethersproject/rlp";
    inherit packument fetchInfo;
  } // latest';

}
