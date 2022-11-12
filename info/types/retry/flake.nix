{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/retry?_rev=432-920ef70cd10c514682fcdfc8ba01331f";
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
    ident = "@types/retry";
    ldir  = "info/types/retry";
    inherit packument fetchInfo;
  } // latest';

}
