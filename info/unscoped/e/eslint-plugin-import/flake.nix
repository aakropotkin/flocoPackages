{

  inputs.packument.url   = "https://registry.npmjs.org/eslint-plugin-import?rev=197-302b66bafa7516de93f6b55d35bdae38";
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
    ident = "eslint-plugin-import";
    ldir  = "info/unscoped/e/eslint-plugin-import";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
