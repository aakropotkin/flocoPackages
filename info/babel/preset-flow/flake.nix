{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/preset-flow?rev=79-e68e396608ab0adf971d1ac2e5890347";
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
    ident = "@babel/preset-flow";
    ldir  = "info/babel/preset-flow";
    inherit packument fetchInfo;
  } // latest';

}
