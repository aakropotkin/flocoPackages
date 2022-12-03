{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-proposal-optional-catch-binding";
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
    ident = "@babel/plugin-proposal-optional-catch-binding";
    ldir  = "info/babel/plugin-proposal-optional-catch-binding";
    inherit packument fetchInfo;
  } // latest';

}
