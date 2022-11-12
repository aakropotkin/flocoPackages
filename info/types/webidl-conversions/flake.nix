{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/webidl-conversions?_rev=282-f06f03852fe9087d7a268bfce83bd204";
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
    ident = "@types/webidl-conversions";
    ldir  = "info/types/webidl-conversions";
    inherit packument fetchInfo;
  } // latest';

}
