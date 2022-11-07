{

  inputs.packument.url   = "https://registry.npmjs.org/@jest/environment?rev=115-94b6aaa5724dd7c38f937ef9eecb625c";
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
    ident = "@jest/environment";
    ldir  = "info/jest/environment";
    inherit packument fetchInfo;
  } // latest';

}
