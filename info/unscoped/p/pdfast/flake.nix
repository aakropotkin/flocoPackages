{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/pdfast?_rev=11-41e660cdeddc856c94013d1f21fcc6f2";
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
    ident = "pdfast";
    ldir  = "info/unscoped/p/pdfast";
    inherit packument fetchInfo;
  } // latest';

}
