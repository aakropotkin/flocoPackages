{

  inputs.packument.url   = "https://registry.npmjs.org/kruptein?rev=38-fe93164f3b03a90176bf4cf2e992dcc4";
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
    ident = "kruptein";
    ldir  = "info/unscoped/k/kruptein";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
