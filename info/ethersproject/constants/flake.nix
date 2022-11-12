{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@ethersproject%2fconstants?_rev=39-cf99b8e45cbe6f7630873b0415cd2a66";
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
    ident = "@ethersproject/constants";
    ldir  = "info/ethersproject/constants";
    inherit packument fetchInfo;
  } // latest';

}
