{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/update-browserslist-db?_rev=10-1fd32f693182827a86e6d2ff334c7456";
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
    ident = "update-browserslist-db";
    ldir  = "info/unscoped/u/update-browserslist-db";
    inherit packument fetchInfo;
  } // latest';

}
