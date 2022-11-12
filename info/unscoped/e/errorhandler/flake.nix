{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/errorhandler?_rev=118-f14c71c0fa8028ab9216668d78b64531";
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
    ident = "errorhandler";
    ldir  = "info/unscoped/e/errorhandler";
    inherit packument fetchInfo;
  } // latest';

}
