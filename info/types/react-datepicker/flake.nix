{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2freact-datepicker?_rev=993-7e67c9231f822e61c8607450cf999883";
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
    ident = "@types/react-datepicker";
    ldir  = "info/types/react-datepicker";
    inherit packument fetchInfo;
  } // latest';

}
