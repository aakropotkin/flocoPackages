{

  inputs.packument.url   = "https://registry.npmjs.org/@jest/schemas?rev=10-6696a01be08ef65f5679be22850ac5ca";
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
    ident = "@jest/schemas";
    ldir  = "info/jest/schemas";
    inherit packument fetchInfo;
  } // latest';

}
