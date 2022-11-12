{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/secure-compare?_rev=8-e23dde791bc4b2c61aec03da457c565b";
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
    ident = "secure-compare";
    ldir  = "info/unscoped/s/secure-compare";
    inherit packument fetchInfo;
  } // latest';

}
