{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/eslint-parser?rev=32-f3f10c852b57da40c578329ea417eb3f";
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
    ident = "@babel/eslint-parser";
    ldir  = "info/babel/eslint-parser";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
