{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@jimp%2fplugin-fisheye?_rev=126-07bca2455d21293bb6a438a206d2f5e5";
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
    ident = "@jimp/plugin-fisheye";
    ldir  = "info/jimp/plugin-fisheye";
    inherit packument fetchInfo;
  } // latest';

}
