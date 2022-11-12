{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/newtype-ts?_rev=18-f328a574af9c195b0b66ac72d4d15175";
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
    ident = "newtype-ts";
    ldir  = "info/unscoped/n/newtype-ts";
    inherit packument fetchInfo;
  } // latest';

}
