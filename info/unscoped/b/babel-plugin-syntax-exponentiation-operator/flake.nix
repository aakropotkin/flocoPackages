{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-syntax-exponentiation-operator?rev=62-afee490332a07c7bb1f5541109f5d2e3";
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
    ident = "babel-plugin-syntax-exponentiation-operator";
    ldir  = "info/unscoped/b/babel-plugin-syntax-exponentiation-operator";
    inherit packument fetchInfo;
  } // latest';

}
