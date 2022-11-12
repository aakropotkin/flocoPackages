{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@typescript-eslint/utils?_rev=698-a98910d45ea8b8c5044bbfdbe3f60d4e";
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
