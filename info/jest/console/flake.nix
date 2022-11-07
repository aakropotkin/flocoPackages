{

  inputs.packument.url   = "https://registry.npmjs.org/@jest/console?rev=103-c8bf64a94884f941c19cb7f1861baccf";
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
    ident = "@jest/console";
    ldir  = "info/jest/console";
    inherit packument fetchInfo;
  } // latest';

}
