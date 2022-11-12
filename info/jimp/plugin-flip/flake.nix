{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@jimp%2fplugin-flip?_rev=129-4cffd28399a68ad1f6fbce246f533e68";
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
    ident = "@jimp/plugin-flip";
    ldir  = "info/jimp/plugin-flip";
    inherit packument fetchInfo;
  } // latest';

}
