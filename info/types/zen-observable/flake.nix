{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/zen-observable?_rev=520-b283cfb3ce9c023f4ee4eb08e758ac8d";
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
    ident = "@types/zen-observable";
    ldir  = "info/types/zen-observable";
    inherit packument fetchInfo;
  } // latest';

}
