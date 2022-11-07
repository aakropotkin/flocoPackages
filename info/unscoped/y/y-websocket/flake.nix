{

  inputs.packument.url   = "https://registry.npmjs.org/y-websocket?rev=50-17796c5796497f13754f4058bb39d476";
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
    ident = "y-websocket";
    ldir  = "info/unscoped/y/y-websocket";
    inherit packument fetchInfo;
  } // latest';

}
