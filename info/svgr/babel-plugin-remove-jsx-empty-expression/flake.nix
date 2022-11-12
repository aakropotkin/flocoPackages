{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@svgr%2fbabel-plugin-remove-jsx-empty-expression?_rev=9-970a606138f3c78a8072858accfe8965";
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
    scope = "@svgr";
    ident = "@svgr/babel-plugin-remove-jsx-empty-expression";
    ldir  = "info/svgr/babel-plugin-remove-jsx-empty-expression";
    inherit packument fetchInfo;
  } // latest';

}
