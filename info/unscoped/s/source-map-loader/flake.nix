{

  inputs.packument.url   = "https://registry.npmjs.org/source-map-loader?rev=60-0e0b1fe58ce75c10e331d154d8b5ce5b";
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
    ident = "source-map-loader";
    ldir  = "info/unscoped/s/source-map-loader";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
