{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@semantic-ui-react/event-stack?_rev=10-2c3bcaf7638a9187622da6e430ffb083";
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
