{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/helper-skip-transparent-expression-wrappers?rev=10-2baa7e28cffd27b8238beee2b234978e";
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
    ident = "@babel/helper-skip-transparent-expression-wrappers";
    ldir  = "info/babel/helper-skip-transparent-expression-wrappers";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
