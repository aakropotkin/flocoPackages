{

  inputs.packument.url   = "https://registry.npmjs.org/@jest/reporters?rev=126-409aa41cb1c8770c4ed40680fd79002f";
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
    ident = "@jest/reporters";
    ldir  = "info/jest/reporters";
    inherit packument fetchInfo;
  } // latest';

}
