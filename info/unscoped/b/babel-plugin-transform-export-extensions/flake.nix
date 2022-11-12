{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/babel-plugin-transform-export-extensions?_rev=63-4a1e254f90114022a076f1224dbaf0bc";
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
    ident = "babel-plugin-transform-export-extensions";
    ldir  = "info/unscoped/b/babel-plugin-transform-export-extensions";
    inherit packument fetchInfo;
  } // latest';

}
