{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@jimp%2ftypes?_rev=132-16d4b8e10f7c900867974f8f9da475d6";
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
    ident = "@jimp/types";
    ldir  = "info/jimp/types";
    inherit packument fetchInfo;
  } // latest';

}
