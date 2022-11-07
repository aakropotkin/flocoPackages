{

  inputs.packument.url   = "https://registry.npmjs.org/@typescript-eslint/parser?rev=2410-8d1aa6c7c81b7ea732f789097ccfc051";
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
