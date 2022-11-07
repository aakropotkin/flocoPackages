{

  inputs.packument.url   = "https://registry.npmjs.org/@jimp/gif?rev=128-6d8ec16c758d2878b5e56ca7c3be0916";
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
    ident = "@jimp/gif";
    ldir  = "info/jimp/gif";
    inherit packument fetchInfo;
  } // latest';

}
