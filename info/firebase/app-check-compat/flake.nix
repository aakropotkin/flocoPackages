{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase/app-check-compat?_rev=493-54ab889522d682ed4a6ec8e7d0457494";
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
    ident = "@firebase/app-check-compat";
    ldir  = "info/firebase/app-check-compat";
    inherit packument fetchInfo;
  } // latest';

}
