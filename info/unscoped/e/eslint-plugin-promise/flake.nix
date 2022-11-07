{

  inputs.packument.url   = "https://registry.npmjs.org/eslint-plugin-promise?rev=76-ac4d91ab0f507335e4150397b57bf096";
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
    ident = "eslint-plugin-promise";
    ldir  = "info/unscoped/e/eslint-plugin-promise";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
