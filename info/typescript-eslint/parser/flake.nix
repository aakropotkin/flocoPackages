{

  inputs.packument.url   = "https://registry.npmjs.org/@typescript-eslint/parser?rev=2411-4f3962b51cc9c71e39e41747b2bf68f2";
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
    ident = "@typescript-eslint/parser";
    ldir  = "info/typescript-eslint/parser";
    inherit packument fetchInfo;
  } // latest';

}
