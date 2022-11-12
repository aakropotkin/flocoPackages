{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fnode-fetch?_rev=1007-457a966cdc7d648d80dcc80765ad73db";
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
    ident = "@types/node-fetch";
    ldir  = "info/types/node-fetch";
    inherit packument fetchInfo;
  } // latest';

}
