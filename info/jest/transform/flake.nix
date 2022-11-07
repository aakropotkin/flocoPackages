{

  inputs.packument.url   = "https://registry.npmjs.org/@jest/transform?rev=123-f8ab751c71bcf431dde8ded2b621e0e5";
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
    ident = "@jest/transform";
    ldir  = "info/jest/transform";
    inherit packument fetchInfo;
  } // latest';

}
