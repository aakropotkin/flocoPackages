{

  inputs.packument.url   = "https://registry.npmjs.org/eslint-config-airbnb?rev=294-85f24ceac4a1e39bee09a21a0ab13cd9";
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
    ident = "eslint-config-airbnb";
    ldir  = "info/unscoped/e/eslint-config-airbnb";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
