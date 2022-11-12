{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@jimp%2fplugin-scale?_rev=128-f5395231ffd21152b39e9f5344db6564";
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
    ident = "@jimp/plugin-scale";
    ldir  = "info/jimp/plugin-scale";
    inherit packument fetchInfo;
  } // latest';

}
