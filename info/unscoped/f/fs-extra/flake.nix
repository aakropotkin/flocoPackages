{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/fs-extra?_rev=631-e1d31ebe1e4a81ddb60f22551586e884";
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
    ident = "fs-extra";
    ldir  = "info/unscoped/f/fs-extra";
    inherit packument fetchInfo;
  } // latest';

}
