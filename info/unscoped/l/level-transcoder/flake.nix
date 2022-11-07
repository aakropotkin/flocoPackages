{

  inputs.packument.url   = "https://registry.npmjs.org/level-transcoder?rev=2-df12aa722a9b00014c6150ffa10a990c";
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
    ident = "level-transcoder";
    ldir  = "info/unscoped/l/level-transcoder";
    inherit packument fetchInfo;
  } // latest';

}
