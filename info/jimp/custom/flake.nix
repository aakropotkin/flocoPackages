{

  inputs.packument.url   = "https://registry.npmjs.org/@jimp/custom?rev=132-0a02e657a21bec821ee4bf47ca54f8ff";
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
    ident = "@jimp/custom";
    ldir  = "info/jimp/custom";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
