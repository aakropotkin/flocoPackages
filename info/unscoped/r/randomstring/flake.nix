{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/randomstring?_rev=52-89657b6206eb1ff749c041d4e6b17ff6";
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
    ident = "randomstring";
    ldir  = "info/unscoped/r/randomstring";
    inherit packument fetchInfo;
  } // latest';

}
