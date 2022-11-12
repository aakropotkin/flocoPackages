{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/metro-babel-transformer?_rev=49-d1b98d74baf4b793063328bf635b6176";
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
    ident = "metro-babel-transformer";
    ldir  = "info/unscoped/m/metro-babel-transformer";
    inherit packument fetchInfo;
  } // latest';

}
