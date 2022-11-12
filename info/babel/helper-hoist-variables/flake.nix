{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel%2fhelper-hoist-variables?_rev=90-79fc40d466feafa2d110646e207c5755";
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
    ident = "@babel/helper-hoist-variables";
    ldir  = "info/babel/helper-hoist-variables";
    inherit packument fetchInfo;
  } // latest';

}
