{

  inputs.packument.url   = "https://registry.npmjs.org/@jimp/plugin-crop?rev=135-59d1191a549413b98cdaf12fcbc0f1ed";
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
    ident = "@jimp/plugin-crop";
    ldir  = "info/jimp/plugin-crop";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
