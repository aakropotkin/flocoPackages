{

  inputs.packument.url   = "https://registry.npmjs.org/fluent-ffmpeg";
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
    scope = null;
    ident = "fluent-ffmpeg";
    ldir  = "info/unscoped/f/fluent-ffmpeg";
    inherit packument fetchInfo;
  } // latest';

}
