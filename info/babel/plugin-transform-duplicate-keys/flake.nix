{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-transform-duplicate-keys?rev=81-6a70490b56f58b37ff8f20f8b8d6a72f";
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
    ident = "@babel/plugin-transform-duplicate-keys";
    ldir  = "info/babel/plugin-transform-duplicate-keys";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
