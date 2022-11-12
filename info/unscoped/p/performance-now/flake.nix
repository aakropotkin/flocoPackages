{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/performance-now?_rev=43-1a03e61c481320ab5cf6607c329b14e9";
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
    ident = "performance-now";
    ldir  = "info/unscoped/p/performance-now";
    inherit packument fetchInfo;
  } // latest';

}
