{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/public-encrypt?_rev=29-9a3a671379482c9e8896d40b8d9e2ceb";
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
    ident = "public-encrypt";
    ldir  = "info/unscoped/p/public-encrypt";
    inherit packument fetchInfo;
  } // latest';

}
