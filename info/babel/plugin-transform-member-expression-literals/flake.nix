{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-transform-member-expression-literals?rev=78-67177e12abcb74eedb298f5dfb9a0794";
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
    ident = "@babel/plugin-transform-member-expression-literals";
    ldir  = "info/babel/plugin-transform-member-expression-literals";
    inherit packument fetchInfo;
  } // latest';

}
