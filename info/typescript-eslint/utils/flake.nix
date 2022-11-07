{

  inputs.packument.url   = "https://registry.npmjs.org/@typescript-eslint/utils?rev=697-aa94a51031465685c2ee6ccaa02c82d2";
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
    ident = "@typescript-eslint/utils";
    ldir  = "info/typescript-eslint/utils";
    inherit packument fetchInfo;
  } // latest';

}
