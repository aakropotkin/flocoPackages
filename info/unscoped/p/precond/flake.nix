{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/precond?_rev=18-c7be5697fd5e4761e5f8b0634cd43db3";
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
    ident = "precond";
    ldir  = "info/unscoped/p/precond";
    inherit packument fetchInfo;
  } // latest';

}
