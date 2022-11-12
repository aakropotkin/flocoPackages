{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/lodash.map?_rev=53-f37cd695b81e68393957b6710b791b7f";
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
    ident = "lodash.map";
    ldir  = "info/unscoped/l/lodash.map";
    inherit packument fetchInfo;
  } // latest';

}
