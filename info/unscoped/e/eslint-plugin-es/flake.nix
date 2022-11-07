{

  inputs.packument.url   = "https://registry.npmjs.org/eslint-plugin-es?rev=15-f5eae7f68ab104a7dd58cf533deef0ff";
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
    ident = "eslint-plugin-es";
    ldir  = "info/unscoped/e/eslint-plugin-es";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
