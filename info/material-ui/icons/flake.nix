{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@material-ui/icons?_rev=76-bed3f36a9a22979f4562195d2eec5e5a";
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
    ident = "@material-ui/icons";
    ldir  = "info/material-ui/icons";
    inherit packument fetchInfo;
  } // latest';

}
