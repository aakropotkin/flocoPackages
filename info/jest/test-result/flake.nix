{

  inputs.packument.url   = "https://registry.npmjs.org/@jest/test-result?rev=105-2f60899ecbab8c6adb8cb77ca63d5bae";
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
    ident = "@jest/test-result";
    ldir  = "info/jest/test-result";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
