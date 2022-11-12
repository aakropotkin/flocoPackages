{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/re2?_rev=66-69239f352097a26560ce79f72af99232";
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
    ident = "re2";
    ldir  = "info/unscoped/r/re2";
    inherit packument fetchInfo;
  } // latest';

}
