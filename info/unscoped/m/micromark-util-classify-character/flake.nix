{

  inputs.packument.url   = "https://registry.npmjs.org/micromark-util-classify-character?rev=5-801d1208e61c8cccbdb72fe55afaa405";
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
    ident = "micromark-util-classify-character";
    ldir  = "info/unscoped/m/micromark-util-classify-character";
    inherit packument fetchInfo;
  } // latest';

}
