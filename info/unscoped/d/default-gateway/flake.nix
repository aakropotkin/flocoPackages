{

  inputs.packument.url   = "https://registry.npmjs.org/default-gateway?rev=50-64d69f2a5dd61f2b43d1ef823af7bc31";
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
    ident = "default-gateway";
    ldir  = "info/unscoped/d/default-gateway";
    inherit packument fetchInfo;
  } // latest';

}
