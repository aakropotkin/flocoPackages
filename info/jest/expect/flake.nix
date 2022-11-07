{

  inputs.packument.url   = "https://registry.npmjs.org/@jest/expect?rev=33-b6a83619d3d2ecb3c92db47a6c6038d4";
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
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
