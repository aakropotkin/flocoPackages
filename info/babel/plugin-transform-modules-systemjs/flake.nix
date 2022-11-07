{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-transform-modules-systemjs?rev=100-b99c1edebf9f4579414bbb2bf09208cf";
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
    ident = "@babel/plugin-transform-modules-systemjs";
    ldir  = "info/babel/plugin-transform-modules-systemjs";
    inherit packument fetchInfo;
  } // latest';

}
