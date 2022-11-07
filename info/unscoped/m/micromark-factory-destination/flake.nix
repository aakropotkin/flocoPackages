{

  inputs.packument.url   = "https://registry.npmjs.org/micromark-factory-destination?rev=5-42d0a7952d74304644e8c310152b5acd";
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
    ident = "micromark-factory-destination";
    ldir  = "info/unscoped/m/micromark-factory-destination";
    inherit packument fetchInfo;
  } // latest';

}
