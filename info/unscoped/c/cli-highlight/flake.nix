{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/cli-highlight?_rev=32-433d608f96db9db00bdb18aaf4c74401";
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
    ident = "cli-highlight";
    ldir  = "info/unscoped/c/cli-highlight";
    inherit packument fetchInfo;
  } // latest';

}
