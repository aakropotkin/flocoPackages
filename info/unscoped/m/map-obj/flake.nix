{

  inputs.packument.url   = "https://registry.npmjs.org/map-obj?rev=26-846fd67a7b9ffd6741c80adc1911b3b6";
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
    ident = "map-obj";
    ldir  = "info/unscoped/m/map-obj";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
