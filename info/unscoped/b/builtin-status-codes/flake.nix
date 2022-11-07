{

  inputs.packument.url   = "https://registry.npmjs.org/builtin-status-codes?rev=6-85c3de4fc11c01ced2df935707a35696";
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
    ident = "builtin-status-codes";
    ldir  = "info/unscoped/b/builtin-status-codes";
    inherit packument fetchInfo;
  } // latest';

}
