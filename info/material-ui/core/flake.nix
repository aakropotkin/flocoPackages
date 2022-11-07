{

  inputs.packument.url   = "https://registry.npmjs.org/@material-ui/core?rev=183-9ed0d2718c75e38bf204f22646c50c89";
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
    ident = "@material-ui/core";
    ldir  = "info/material-ui/core";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
