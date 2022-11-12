{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/symlink-or-copy?_rev=24-4ab5f2857f6b01d0f5473a7e6d20ab53";
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
    ident = "symlink-or-copy";
    ldir  = "info/unscoped/s/symlink-or-copy";
    inherit packument fetchInfo;
  } // latest';

}
