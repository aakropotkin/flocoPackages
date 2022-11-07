{

  inputs.packument.url   = "https://registry.npmjs.org/@jimp/plugin-dither?rev=130-090b64fb7e05909daceb1dc851d2c049";
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
    ident = "@jimp/plugin-dither";
    ldir  = "info/jimp/plugin-dither";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
