{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-schedule?_rev=381-a9147a5dd89aa2334fec865287462da2";
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
    ident = "node-schedule";
    ldir  = "info/unscoped/n/node-schedule";
    inherit packument fetchInfo;
  } // latest';

}
