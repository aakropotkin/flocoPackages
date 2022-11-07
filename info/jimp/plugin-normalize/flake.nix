{

  inputs.packument.url   = "https://registry.npmjs.org/@jimp/plugin-normalize?rev=134-069194b4fc618ee0dee4751833889b42";
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
    ident = "@jimp/plugin-normalize";
    ldir  = "info/jimp/plugin-normalize";
    inherit packument fetchInfo;
  } // latest';

}
