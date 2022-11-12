{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@redis%2fjson?_rev=1-80685e755a79f96e539079875a040d68";
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
    ident = "@redis/json";
    ldir  = "info/redis/json";
    inherit packument fetchInfo;
  } // latest';

}
