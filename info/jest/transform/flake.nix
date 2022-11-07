{

  inputs.packument.url   = "https://registry.npmjs.org/@jest/transform?rev=122-a875c9645eac9d72c4b44a27d13edb7c";
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
