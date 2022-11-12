{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@typescript-eslint/typescript-estree?_rev=2414-5600eb2f5fe57f67b826a052e679f088";
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
    inherit packument fetchInfo;
  } // latest';

}
