{

  inputs.packument.url   = "https://registry.npmjs.org/metro-transform-worker?rev=36-5f4c3a2a4d2471c3662bf5b3f1adc68e";
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
    ident = "metro-transform-worker";
    ldir  = "info/unscoped/m/metro-transform-worker";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
