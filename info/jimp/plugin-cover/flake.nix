{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@jimp/plugin-cover?_rev=135-47649cc1bbe440238c66bfae4fa377fd";
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
    ident = "@jimp/plugin-cover";
    ldir  = "info/jimp/plugin-cover";
    inherit packument fetchInfo;
  } // latest';

}
