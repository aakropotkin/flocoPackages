{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@typescript-eslint/scope-manager?_rev=1644-ffd3052cdade5785b00b7d974bd51a25";
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
