{

  inputs.packument.url   = "https://registry.npmjs.org/aproba?rev=40-cb8bd4853524e89005b13c4656690526";
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
    ident = "aproba";
    ldir  = "info/unscoped/a/aproba";
    inherit packument fetchInfo;
  } // latest';

}
