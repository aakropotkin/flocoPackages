{

  inputs.packument.url   = "https://registry.npmjs.org/@typescript-eslint/typescript-estree?rev=2413-9c6f63ecb67ae0b1a2751e09f14130a8";
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
    ident = "@typescript-eslint/typescript-estree";
    ldir  = "info/typescript-eslint/typescript-estree";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
