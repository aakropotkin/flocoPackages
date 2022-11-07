{

  inputs.packument.url   = "https://registry.npmjs.org/pause-stream?rev=30-5ff943614a74939b6ff308343c3ec9fc";
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
    ident = "pause-stream";
    ldir  = "info/unscoped/p/pause-stream";
    inherit packument fetchInfo;
  } // latest';

}
