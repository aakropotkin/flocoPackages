{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase/firestore-types?_rev=2552-6a79132067198ab76da34a03342d8a85";
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
    ident = "@firebase/firestore-types";
    ldir  = "info/firebase/firestore-types";
    inherit packument fetchInfo;
  } // latest';

}
