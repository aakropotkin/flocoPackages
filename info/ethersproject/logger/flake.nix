{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@ethersproject%2flogger?_rev=38-97ed207ac0076e82d40ece24cfb032fd";
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
    ident = "@ethersproject/logger";
    ldir  = "info/ethersproject/logger";
    inherit packument fetchInfo;
  } // latest';

}
