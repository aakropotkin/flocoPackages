{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@jimp%2fplugin-print?_rev=135-242a3c6549a4ba178d96db8df472b22d";
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
    ident = "@jimp/plugin-print";
    ldir  = "info/jimp/plugin-print";
    inherit packument fetchInfo;
  } // latest';

}
