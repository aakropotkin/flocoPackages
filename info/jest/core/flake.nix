{

  inputs.packument.url   = "https://registry.npmjs.org/@jest/core?rev=138-5d8eb0e00bff480c291d1949b772d1b3";
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
    ident = "@jest/core";
    ldir  = "info/jest/core";
    inherit packument fetchInfo;
  } // latest';

}
