{

  inputs.packument.url   = "https://registry.npmjs.org/dequal?rev=7-d1bf1f7c9cefce63437e1dbc2b2e6d41";
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
    ident = "dequal";
    ldir  = "info/unscoped/d/dequal";
    inherit packument fetchInfo;
  } // latest';

}
