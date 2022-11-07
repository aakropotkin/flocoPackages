{

  inputs.packument.url   = "https://registry.npmjs.org/thread-stream?rev=35-41f261d923906b39310cf9da00987b85";
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
    ident = "thread-stream";
    ldir  = "info/unscoped/t/thread-stream";
    inherit packument fetchInfo;
  } // latest';

}
