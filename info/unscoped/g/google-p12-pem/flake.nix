{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/google-p12-pem?_rev=57-d875b6890612b4b5c4996c33cc5e81f6";
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
    scope = null;
    ident = "google-p12-pem";
    ldir  = "info/unscoped/g/google-p12-pem";
    inherit packument fetchInfo;
  } // latest';

}
