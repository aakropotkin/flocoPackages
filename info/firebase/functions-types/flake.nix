{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase/functions-types?_rev=2458-e0768b34c1d2ed49d25f20c7a70174bd";
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
    ident = "@firebase/functions-types";
    ldir  = "info/firebase/functions-types";
    inherit packument fetchInfo;
  } // latest';

}
