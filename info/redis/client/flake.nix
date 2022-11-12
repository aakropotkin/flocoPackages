{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@redis/client?_rev=5-da1ed2a26756f7f1510563f106c5f1a7";
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
    scope = "@redis";
    ident = "@redis/client";
    ldir  = "info/redis/client";
    inherit packument fetchInfo;
  } // latest';

}
