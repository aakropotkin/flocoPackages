{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/requizzle?_rev=15-90d1193ef6da13b8442e735c92144366";
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
    ident = "requizzle";
    ldir  = "info/unscoped/r/requizzle";
    inherit packument fetchInfo;
  } // latest';

}
