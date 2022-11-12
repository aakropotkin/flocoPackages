{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/tedious?_rev=657-cc246269961b30611dab8371709844a4";
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
    ident = "@types/tedious";
    ldir  = "info/types/tedious";
    inherit packument fetchInfo;
  } // latest';

}
