{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-transform-exponentiation-operator?rev=79-a63d47b6f4edac5b3090733f6cb9e61a";
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
    scope = "@babel";
    ident = "@babel/plugin-transform-exponentiation-operator";
    ldir  = "info/babel/plugin-transform-exponentiation-operator";
    inherit packument fetchInfo;
  } // latest';

}
