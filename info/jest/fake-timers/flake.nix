{

  inputs.packument.url   = "https://registry.npmjs.org/@jest/fake-timers?rev=110-cd3295c2b4baa51b15e804d97d7d2a15";
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
    ident = "@jest/fake-timers";
    ldir  = "info/jest/fake-timers";
    inherit packument fetchInfo;
  } // latest';

}
