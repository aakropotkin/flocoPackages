{

  inputs.packument.url   = "https://registry.npmjs.org/@jimp/plugin-gaussian?rev=129-c7ce2fd3d9dff7ea41a7f7c58aff8f8d";
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
    ident = "@jimp/plugin-gaussian";
    ldir  = "info/jimp/plugin-gaussian";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
