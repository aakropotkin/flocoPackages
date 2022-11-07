{

  inputs.packument.url   = "https://registry.npmjs.org/faye-websocket?rev=84-a26bc264fbc1b1cc77b0946b624fe082";
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
    ident = "faye-websocket";
    ldir  = "info/unscoped/f/faye-websocket";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
