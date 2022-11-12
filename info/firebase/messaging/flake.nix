{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase/messaging?_rev=2718-769bb1d6c82fe8899df15ed9bc1417ff";
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
    ident = "@firebase/messaging";
    ldir  = "info/firebase/messaging";
    inherit packument fetchInfo;
  } // latest';

}
