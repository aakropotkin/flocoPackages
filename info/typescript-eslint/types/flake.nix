{

  inputs.packument.url   = "https://registry.npmjs.org/@typescript-eslint/types?rev=1650-f7bbea21c593ec73dd54dc7e0565fc11";
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
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
