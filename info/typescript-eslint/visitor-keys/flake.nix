{

  inputs.packument.url   = "https://registry.npmjs.org/@typescript-eslint/visitor-keys?rev=1650-c27a7a323d5f30ebf150dd63b2c09a5b";
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
    ident = "@typescript-eslint/visitor-keys";
    ldir  = "info/typescript-eslint/visitor-keys";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
