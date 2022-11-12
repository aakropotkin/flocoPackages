{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase%2fperformance?_rev=2147-b0d9e9196e1f0f3c8ff0007bccae6b0b";
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
    ident = "@firebase/performance";
    ldir  = "info/firebase/performance";
    inherit packument fetchInfo;
  } // latest';

}
