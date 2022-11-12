{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@redis%2fbloom?_rev=1-8563921e1dba5ce6b40a9b88836d012c";
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
    ident = "@redis/bloom";
    ldir  = "info/redis/bloom";
    inherit packument fetchInfo;
  } // latest';

}
