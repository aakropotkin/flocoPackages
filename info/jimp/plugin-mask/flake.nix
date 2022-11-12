{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@jimp/plugin-mask?_rev=133-b58ce2ea864d909b6b1e4305c5bef698";
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
    ident = "@jimp/plugin-mask";
    ldir  = "info/jimp/plugin-mask";
    inherit packument fetchInfo;
  } // latest';

}
