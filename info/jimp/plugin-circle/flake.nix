{

  inputs.packument.url   = "https://registry.npmjs.org/@jimp/plugin-circle?rev=126-637bbdfcf7384b1b2cb336d787d83c07";
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
    ident = "@jimp/plugin-circle";
    ldir  = "info/jimp/plugin-circle";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
