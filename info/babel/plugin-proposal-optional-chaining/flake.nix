{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel%2fplugin-proposal-optional-chaining?_rev=94-5bf4ea6cf9bfa49d281a42cfdfb2d392";
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
    scope = "@babel";
    ident = "@babel/plugin-proposal-optional-chaining";
    ldir  = "info/babel/plugin-proposal-optional-chaining";
    inherit packument fetchInfo;
  } // latest';

}
