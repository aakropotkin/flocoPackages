{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@jimp/png?_rev=133-e65418982ee5238e241e2d7aca3d6e03";
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
    ident = "@jimp/png";
    ldir  = "info/jimp/png";
    inherit packument fetchInfo;
  } // latest';

}
