{

  inputs.packument.url   = "https://registry.npmjs.org/@fluentui/react-component-event-listener?rev=89-571938fa390eab778908fa7d64e21b67";
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
    scope = "@fluentui";
    ident = "@fluentui/react-component-event-listener";
    ldir  = "info/fluentui/react-component-event-listener";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
