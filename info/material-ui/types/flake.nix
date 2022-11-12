{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@material-ui/types?_rev=32-a6a215408aa4ba78213f69f4331f797a";
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
    scope = "@material-ui";
    ident = "@material-ui/types";
    ldir  = "info/material-ui/types";
    inherit packument fetchInfo;
  } // latest';

}
