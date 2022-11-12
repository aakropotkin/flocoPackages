{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/jest-resolve-dependencies?_rev=299-9234b74446f78947d47ac8c69aa6c5ad";
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
    ident = "jest-resolve-dependencies";
    ldir  = "info/unscoped/j/jest-resolve-dependencies";
    inherit packument fetchInfo;
  } // latest';

}
