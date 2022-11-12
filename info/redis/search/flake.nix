{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@redis%2fsearch?_rev=1-dc88cdd478f0e6562a8309a83fc5e0d6";
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
    ident = "@redis/search";
    ldir  = "info/redis/search";
    inherit packument fetchInfo;
  } // latest';

}
