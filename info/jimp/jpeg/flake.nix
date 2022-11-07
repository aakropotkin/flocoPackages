{

  inputs.packument.url   = "https://registry.npmjs.org/@jimp/jpeg?rev=133-a45cac55b95861a0794593bf440a640c";
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
    ident = "@jimp/jpeg";
    ldir  = "info/jimp/jpeg";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
