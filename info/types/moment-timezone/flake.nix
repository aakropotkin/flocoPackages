{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fmoment-timezone?_rev=580-3374dfd7f1f94770eabe54ba7c6ab27f";
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
    ident = "@types/moment-timezone";
    ldir  = "info/types/moment-timezone";
    inherit packument fetchInfo;
  } // latest';

}
