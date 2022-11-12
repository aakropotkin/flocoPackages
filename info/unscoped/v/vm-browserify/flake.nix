{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/vm-browserify?_rev=55-481d3d733bcbc913dfc4bf3fe98c7bf7";
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
    ident = "vm-browserify";
    ldir  = "info/unscoped/v/vm-browserify";
    inherit packument fetchInfo;
  } // latest';

}
