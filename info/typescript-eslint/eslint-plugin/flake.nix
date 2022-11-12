{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@typescript-eslint/eslint-plugin?_rev=2364-46ac7f4a03f72b68ffad7d34bda6f87a";
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
    ident = "@typescript-eslint/eslint-plugin";
    ldir  = "info/typescript-eslint/eslint-plugin";
    inherit packument fetchInfo;
  } // latest';

}
