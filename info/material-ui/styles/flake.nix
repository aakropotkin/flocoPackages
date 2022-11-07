{

  inputs.packument.url   = "https://registry.npmjs.org/@material-ui/styles?rev=103-5d073d43a3c30e4879afd780deda2b2e";
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
    ident = "@material-ui/styles";
    ldir  = "info/material-ui/styles";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
