{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/envinfo?_rev=92-17c31d507b6fb3a7fd229f574171ee8d";
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
    ident = "envinfo";
    ldir  = "info/unscoped/e/envinfo";
    inherit packument fetchInfo;
  } // latest';

}
