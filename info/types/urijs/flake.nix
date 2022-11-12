{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2furijs?_rev=661-5af0a280c5a5352188b83a95d5b9f559";
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
    ident = "@types/urijs";
    ldir  = "info/types/urijs";
    inherit packument fetchInfo;
  } // latest';

}
