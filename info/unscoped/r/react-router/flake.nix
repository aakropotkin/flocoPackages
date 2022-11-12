{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/react-router?_rev=639-d8f98d4be8b69eea7c2f3b89844b0693";
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
    ident = "react-router";
    ldir  = "info/unscoped/r/react-router";
    inherit packument fetchInfo;
  } // latest';

}
