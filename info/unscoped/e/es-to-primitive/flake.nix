{

  inputs.packument.url   = "https://registry.npmjs.org/es-to-primitive?rev=10-4dddb103a8625af385112760049232f7";
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
    ident = "es-to-primitive";
    ldir  = "info/unscoped/e/es-to-primitive";
    inherit packument fetchInfo;
  } // latest';

}
