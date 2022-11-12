{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@jimp%2fcore?_rev=133-1313fb0237a485780b579ef8c850e7b4";
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
    ident = "@jimp/core";
    ldir  = "info/jimp/core";
    inherit packument fetchInfo;
  } // latest';

}
