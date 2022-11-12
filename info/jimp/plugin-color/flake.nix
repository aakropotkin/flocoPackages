{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@jimp%2fplugin-color?_rev=136-517fe10b09240dc13e45b1fc7d38b71d";
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
    ident = "@jimp/plugin-color";
    ldir  = "info/jimp/plugin-color";
    inherit packument fetchInfo;
  } // latest';

}
