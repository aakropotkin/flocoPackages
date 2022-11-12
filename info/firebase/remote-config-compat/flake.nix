{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase/remote-config-compat?_rev=516-a089766438c219f080dbddf872f516d9";
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
    ident = "@firebase/remote-config-compat";
    ldir  = "info/firebase/remote-config-compat";
    inherit packument fetchInfo;
  } // latest';

}
