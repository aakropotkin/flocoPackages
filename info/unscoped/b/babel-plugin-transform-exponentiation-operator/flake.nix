{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-transform-exponentiation-operator?rev=62-3cd4cd94590c37f8346db1efadc5e1a7";
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
    ident = "babel-plugin-transform-exponentiation-operator";
    ldir  = "info/unscoped/b/babel-plugin-transform-exponentiation-operator";
    inherit packument fetchInfo;
  } // latest';

}
