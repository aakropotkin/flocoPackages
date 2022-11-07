{

  inputs.packument.url   = "https://registry.npmjs.org/file-stream-rotator?rev=71-9734f46d5d63246a332377a214c7689e";
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
    ident = "file-stream-rotator";
    ldir  = "info/unscoped/f/file-stream-rotator";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
