{

  inputs.packument.url   = "https://registry.npmjs.org/test-console?rev=11-e05490045c48e7b449cb61b1d0bd1cba";
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
    ident = "test-console";
    ldir  = "info/unscoped/t/test-console";
    inherit packument fetchInfo;
  } // latest';

}
