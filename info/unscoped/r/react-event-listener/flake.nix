{

  inputs.packument.url   = "https://registry.npmjs.org/react-event-listener?rev=40-fd984cb9431672cf4b301403aaad7e94";
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
    ident = "react-event-listener";
    ldir  = "info/unscoped/r/react-event-listener";
    inherit packument fetchInfo;
  } // latest';

}
