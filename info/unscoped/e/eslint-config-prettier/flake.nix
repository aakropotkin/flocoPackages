{

  inputs.packument.url   = "https://registry.npmjs.org/eslint-config-prettier?rev=78-31f57bea7a892cc565d1e42604c33890";
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
    scope = null;
    ident = "eslint-config-prettier";
    ldir  = "info/unscoped/e/eslint-config-prettier";
    inherit packument fetchInfo;
  } // latest';

}
