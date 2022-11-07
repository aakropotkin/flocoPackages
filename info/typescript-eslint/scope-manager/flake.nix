{

  inputs.packument.url   = "https://registry.npmjs.org/@typescript-eslint/scope-manager?rev=1643-46ffb2fd06379cfbbda7b703e438e77e";
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
    ident = "@typescript-eslint/scope-manager";
    ldir  = "info/typescript-eslint/scope-manager";
    inherit packument fetchInfo;
  } // latest';

}
