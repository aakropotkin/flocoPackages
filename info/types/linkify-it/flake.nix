{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/linkify-it?_rev=581-eb1401906dd6f3368adfd8c84207a7ff";
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
    ident = "@types/linkify-it";
    ldir  = "info/types/linkify-it";
    inherit packument fetchInfo;
  } // latest';

}
