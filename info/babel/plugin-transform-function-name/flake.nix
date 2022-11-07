{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-transform-function-name?rev=83-633de6637abeff59ddb4ed92a8335c23";
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
    ident = "@babel/plugin-transform-function-name";
    ldir  = "info/babel/plugin-transform-function-name";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
