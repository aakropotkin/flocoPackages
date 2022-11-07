{

  inputs.packument.url   = "https://registry.npmjs.org/@jimp/plugin-shadow?rev=127-ca538e948b9ad4befd70fe9ca1d13ce2";
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
    ident = "@jimp/plugin-shadow";
    ldir  = "info/jimp/plugin-shadow";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
