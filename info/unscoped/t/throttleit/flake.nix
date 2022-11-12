{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/throttleit?_rev=41-d616b996ee2bf54421a92282fcea4322";
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
    ident = "throttleit";
    ldir  = "info/unscoped/t/throttleit";
    inherit packument fetchInfo;
  } // latest';

}
