{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fjquery?_rev=1311-e4650a7e62414d58cdee0600a37bb18e";
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
    scope = "@types";
    ident = "@types/jquery";
    ldir  = "info/types/jquery";
    inherit packument fetchInfo;
  } // latest';

}
