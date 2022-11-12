{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/stylus?_rev=585-b4479e1401bda3a13f8ea71f998741f2";
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
    ident = "stylus";
    ldir  = "info/unscoped/s/stylus";
    inherit packument fetchInfo;
  } // latest';

}
