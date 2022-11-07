{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-proposal-export-namespace-from?rev=73-91da6c3b7ff05f7b917960d02ce53290";
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
    ident = "@babel/plugin-proposal-export-namespace-from";
    ldir  = "info/babel/plugin-proposal-export-namespace-from";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
