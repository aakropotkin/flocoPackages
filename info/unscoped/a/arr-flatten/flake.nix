{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/arr-flatten?_rev=20-4a97887a01dd4a20f0200d46adf69346";
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
    ident = "arr-flatten";
    ldir  = "info/unscoped/a/arr-flatten";
    inherit packument fetchInfo;
  } // latest';

}
