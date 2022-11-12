{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fresolve?_rev=568-0a3683621019ea681320ab44c78cdbf1";
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
    ident = "@types/resolve";
    ldir  = "info/types/resolve";
    inherit packument fetchInfo;
  } // latest';

}
