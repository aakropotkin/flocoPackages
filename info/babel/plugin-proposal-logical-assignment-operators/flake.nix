{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel%2fplugin-proposal-logical-assignment-operators?_rev=61-097382756c127a3e5909c45cdc28818e";
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
    ident = "@babel/plugin-proposal-logical-assignment-operators";
    ldir  = "info/babel/plugin-proposal-logical-assignment-operators";
    inherit packument fetchInfo;
  } // latest';

}
