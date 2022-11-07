{

  inputs.packument.url   = "https://registry.npmjs.org/@typescript-eslint/types?rev=1651-438c66a0dda10d9807e1a72853dcc4d8";
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
    scope = "@typescript-eslint";
    ident = "@typescript-eslint/types";
    ldir  = "info/typescript-eslint/types";
    inherit packument fetchInfo;
  } // latest';

}
