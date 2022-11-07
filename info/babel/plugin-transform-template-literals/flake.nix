{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-transform-template-literals?rev=85-7c7e8544dfc4fd0e91bbba97a0b05dfe";
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
    ident = "@babel/plugin-transform-template-literals";
    ldir  = "info/babel/plugin-transform-template-literals";
    inherit packument fetchInfo;
  } // latest';

}
