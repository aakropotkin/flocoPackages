{

  inputs.packument.url   = "https://registry.npmjs.org/@jest/globals?rev=96-5823311b27171e24fcc33eda370b6402";
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
    ident = "@jest/globals";
    ldir  = "info/jest/globals";
    inherit packument fetchInfo;
  } // latest';

}
