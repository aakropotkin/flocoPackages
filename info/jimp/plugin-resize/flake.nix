{

  inputs.packument.url   = "https://registry.npmjs.org/@jimp/plugin-resize?rev=133-e83db9663d5f7b1980b3f1e06aa2a46b";
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
    scope = "@jimp";
    ident = "@jimp/plugin-resize";
    ldir  = "info/jimp/plugin-resize";
    inherit packument fetchInfo;
  } // latest';

}
