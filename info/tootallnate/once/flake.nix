{

  inputs.packument.url   = "https://registry.npmjs.org/@tootallnate/once?rev=7-9e98da2c9d3dbc8581742ead9687e649";
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
    scope = "@tootallnate";
    ident = "@tootallnate/once";
    ldir  = "info/tootallnate/once";
    inherit packument fetchInfo;
  } // latest';

}
