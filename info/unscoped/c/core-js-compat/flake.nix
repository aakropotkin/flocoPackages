{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/core-js-compat?_rev=116-72cc234842c37aaf1287f818b978a7fc";
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
    ident = "core-js-compat";
    ldir  = "info/unscoped/c/core-js-compat";
    inherit packument fetchInfo;
  } // latest';

}
