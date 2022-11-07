{

  inputs.packument.url   = "https://registry.npmjs.org/fs-constants?rev=1-19ed7e4ced0558104b3664b86391dc04";
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
    ident = "fs-constants";
    ldir  = "info/unscoped/f/fs-constants";
    inherit packument fetchInfo;
  } // latest';

}
