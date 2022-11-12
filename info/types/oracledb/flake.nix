{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2foracledb?_rev=595-b1d724b2ef9a1440108952ef84634a5c";
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
    scope = "@types";
    ident = "@types/oracledb";
    ldir  = "info/types/oracledb";
    inherit packument fetchInfo;
  } // latest';

}
