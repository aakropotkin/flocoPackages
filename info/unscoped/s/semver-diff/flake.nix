{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/semver-diff?_rev=15-d129e53523d31e090e8276e142a5ab54";
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
    ident = "semver-diff";
    ldir  = "info/unscoped/s/semver-diff";
    inherit packument fetchInfo;
  } // latest';

}
