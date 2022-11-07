{

  inputs.packument.url   = "https://registry.npmjs.org/eslint-config-react-app?rev=165-8366dbccc505780ee475708f4f52cee8";
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
    ident = "eslint-config-react-app";
    ldir  = "info/unscoped/e/eslint-config-react-app";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
