{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fsizzle?_rev=421-bb052810d1085b6fa8a620f7870e42ec";
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
    ident = "@types/sizzle";
    ldir  = "info/types/sizzle";
    inherit packument fetchInfo;
  } // latest';

}
