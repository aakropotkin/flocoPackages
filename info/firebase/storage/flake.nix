{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase%2fstorage?_rev=2705-02772f6e1dffcb4bde7e92bbea31fb35";
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
    ident = "@firebase/storage";
    ldir  = "info/firebase/storage";
    inherit packument fetchInfo;
  } // latest';

}
