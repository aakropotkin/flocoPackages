{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/bomstrip?_rev=12-04cc1a25fd528b370e080e77941988db";
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
    ident = "bomstrip";
    ldir  = "info/unscoped/b/bomstrip";
    inherit packument fetchInfo;
  } // latest';

}
