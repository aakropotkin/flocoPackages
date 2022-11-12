{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase/firestore?_rev=2927-55cc2a5fa5e6e5ff3c8eeab33b584074";
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
    ident = "@firebase/firestore";
    ldir  = "info/firebase/firestore";
    inherit packument fetchInfo;
  } // latest';

}
