{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/slugify?_rev=73-feef432d95ad8414e0a8d6e88e709325";
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
    ident = "slugify";
    ldir  = "info/unscoped/s/slugify";
    inherit packument fetchInfo;
  } // latest';

}
