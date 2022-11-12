{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase%2fapp-compat?_rev=546-95b20d2cb40f53f1b7de1cf72c7b101b";
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
    ident = "@firebase/app-compat";
    ldir  = "info/firebase/app-compat";
    inherit packument fetchInfo;
  } // latest';

}
