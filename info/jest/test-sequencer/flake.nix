{

  inputs.packument.url   = "https://registry.npmjs.org/@jest/test-sequencer?rev=124-0151fbe6433f4f405c2bff009ac341fe";
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
    scope = "@jest";
    ident = "@jest/test-sequencer";
    ldir  = "info/jest/test-sequencer";
    inherit packument fetchInfo;
  } // latest';

}
