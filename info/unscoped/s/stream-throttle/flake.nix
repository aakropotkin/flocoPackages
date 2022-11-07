{

  inputs.packument.url   = "https://registry.npmjs.org/stream-throttle?rev=19-be42cecfab7d43a9b3421263ba6c9dc3";
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
    ident = "stream-throttle";
    ldir  = "info/unscoped/s/stream-throttle";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
