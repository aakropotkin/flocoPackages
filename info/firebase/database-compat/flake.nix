{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase/database-compat?_rev=484-8067b566589b69c0da6ff7019c6adc3c";
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
    ident = "@firebase/database-compat";
    ldir  = "info/firebase/database-compat";
    inherit packument fetchInfo;
  } // latest';

}
