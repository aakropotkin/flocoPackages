{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/lodash.isinteger?_rev=10-46bfc785a8d5ee08ad73a7df5de0dde2";
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
    ident = "lodash.isinteger";
    ldir  = "info/unscoped/l/lodash.isinteger";
    inherit packument fetchInfo;
  } // latest';

}
