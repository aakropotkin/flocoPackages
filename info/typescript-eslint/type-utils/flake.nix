{

  inputs.packument.url   = "https://registry.npmjs.org/@typescript-eslint/type-utils?rev=720-2e280bba9ea25d15f4e70c74cd2ce4fb";
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
    ident = "@typescript-eslint/type-utils";
    ldir  = "info/typescript-eslint/type-utils";
    inherit packument fetchInfo;
  } // latest';

}
