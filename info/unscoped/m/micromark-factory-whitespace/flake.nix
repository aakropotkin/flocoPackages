{

  inputs.packument.url   = "https://registry.npmjs.org/micromark-factory-whitespace?rev=5-e0699ad5be4575dbddb2c59c1a284829";
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
    ident = "micromark-factory-whitespace";
    ldir  = "info/unscoped/m/micromark-factory-whitespace";
    inherit packument fetchInfo;
  } // latest';

}
