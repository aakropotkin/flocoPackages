{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/emittery?_rev=34-f54dafc2c51abd1cfa46fc6d866749c5";
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
    ident = "emittery";
    ldir  = "info/unscoped/e/emittery";
    inherit packument fetchInfo;
  } // latest';

}
