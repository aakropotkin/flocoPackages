{

  inputs.packument.url   = "https://registry.npmjs.org/eslint-plugin-eslint-comments?rev=25-778eb50f403b2770bfe5ce342ef2d84d";
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
    ident = "eslint-plugin-eslint-comments";
    ldir  = "info/unscoped/e/eslint-plugin-eslint-comments";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
