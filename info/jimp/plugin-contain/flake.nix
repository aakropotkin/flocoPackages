{

  inputs.packument.url   = "https://registry.npmjs.org/@jimp/plugin-contain?rev=134-c7c80badc68d2c532cff164baa34b5af";
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
    ident = "@jimp/plugin-contain";
    ldir  = "info/jimp/plugin-contain";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
