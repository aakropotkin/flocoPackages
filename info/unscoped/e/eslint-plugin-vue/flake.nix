{

  inputs.packument.url   = "https://registry.npmjs.org/eslint-plugin-vue?rev=165-07324460f60200e20b8c929931ead48c";
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
    ident = "eslint-plugin-vue";
    ldir  = "info/unscoped/e/eslint-plugin-vue";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
