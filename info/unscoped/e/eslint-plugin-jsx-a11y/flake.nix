{

  inputs.packument.url   = "https://registry.npmjs.org/eslint-plugin-jsx-a11y?rev=117-58dc1936dad7e41f7d6ef82c2d34acc4";
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
    ident = "eslint-plugin-jsx-a11y";
    ldir  = "info/unscoped/e/eslint-plugin-jsx-a11y";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
