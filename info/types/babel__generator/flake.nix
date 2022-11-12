{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fbabel__generator?_rev=393-95dc6aae0e32c58334832a32c8dc9f95";
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
    ident = "@types/babel__generator";
    ldir  = "info/types/babel__generator";
    inherit packument fetchInfo;
  } // latest';

}
