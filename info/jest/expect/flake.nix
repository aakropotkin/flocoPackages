{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@jest%2fexpect?_rev=34-f5ee9671d5e69ffc9775cf2b185ccbd6";
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
    ident = "@jest/expect";
    ldir  = "info/jest/expect";
    inherit packument fetchInfo;
  } // latest';

}
