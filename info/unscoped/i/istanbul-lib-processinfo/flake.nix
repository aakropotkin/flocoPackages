{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/istanbul-lib-processinfo?_rev=9-168400ac095f96f3656052a2ee3f989b";
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
    ident = "istanbul-lib-processinfo";
    ldir  = "info/unscoped/i/istanbul-lib-processinfo";
    inherit packument fetchInfo;
  } // latest';

}
