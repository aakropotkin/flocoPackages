{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase/functions?_rev=2665-090c4c1f8603eeb5cd820e63ecb958dd";
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
    scope = "@firebase";
    ident = "@firebase/functions";
    ldir  = "info/firebase/functions";
    inherit packument fetchInfo;
  } // latest';

}
