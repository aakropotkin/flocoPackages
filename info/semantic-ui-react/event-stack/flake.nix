{

  inputs.packument.url   = "https://registry.npmjs.org/@semantic-ui-react/event-stack";
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
    scope = "@semantic-ui-react";
    ident = "@semantic-ui-react/event-stack";
    ldir  = "info/semantic-ui-react/event-stack";
    inherit packument fetchInfo;
  } // latest';

}
