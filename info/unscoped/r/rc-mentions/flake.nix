{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/rc-mentions?_rev=47-b515c4e41ef89625d91f49369dcb95bf";
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
    ident = "rc-mentions";
    ldir  = "info/unscoped/r/rc-mentions";
    inherit packument fetchInfo;
  } // latest';

}
