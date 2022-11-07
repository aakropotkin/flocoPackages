{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-proposal-export-default-from?rev=72-ffd3c216755b535a6ac4224bf0d5b1b1";
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
    ident = "@babel/plugin-proposal-export-default-from";
    ldir  = "info/babel/plugin-proposal-export-default-from";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
