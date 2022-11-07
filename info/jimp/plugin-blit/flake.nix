{

  inputs.packument.url   = "https://registry.npmjs.org/@jimp/plugin-blit?rev=134-ee8f91d4b69eb859d8f4807f73de82a1";
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
    ident = "@jimp/plugin-blit";
    ldir  = "info/jimp/plugin-blit";
    inherit packument fetchInfo;
  } // latest';

}
