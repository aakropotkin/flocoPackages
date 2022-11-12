{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/psl?_rev=60-399c7381c4b81b3da23963614504e6e8";
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
    ident = "psl";
    ldir  = "info/unscoped/p/psl";
    inherit packument fetchInfo;
  } // latest';

}
