{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/helper-function-name?rev=93-42b5720530c85a7c4268576a1890f33e";
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
    ident = "@babel/helper-function-name";
    ldir  = "info/babel/helper-function-name";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
