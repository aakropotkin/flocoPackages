{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-bugfix-safari-id-destructuring-collision-in-function-expression?rev=7-95c766d7e2032fbb4abe65d83b0a15e7";
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
    ident = "@babel/plugin-bugfix-safari-id-destructuring-collision-in-function-expression";
    ldir  = "info/babel/plugin-bugfix-safari-id-destructuring-collision-in-function-expression";
    inherit packument fetchInfo;
  } // latest';

}
