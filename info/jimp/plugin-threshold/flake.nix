{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@jimp%2fplugin-threshold?_rev=127-7dd9d7ef68518d3bb4b881d4c7c319ea";
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
    ident = "@jimp/plugin-threshold";
    ldir  = "info/jimp/plugin-threshold";
    inherit packument fetchInfo;
  } // latest';

}
