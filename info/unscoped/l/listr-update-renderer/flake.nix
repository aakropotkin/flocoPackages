{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/listr-update-renderer?_rev=12-861d68fb6f3d49d70e3dafffe78729fa";
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
    ident = "listr-update-renderer";
    ldir  = "info/unscoped/l/listr-update-renderer";
    inherit packument fetchInfo;
  } // latest';

}
