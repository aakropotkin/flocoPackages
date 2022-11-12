{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@material-ui%2futils?_rev=64-48b13edff9186c403b6b8b3cb4ab5300";
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
    ident = "@material-ui/utils";
    ldir  = "info/material-ui/utils";
    inherit packument fetchInfo;
  } // latest';

}
