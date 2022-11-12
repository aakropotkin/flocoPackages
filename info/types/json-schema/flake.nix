{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/json-schema?_rev=624-87a9b8735a18cd44bbc225ea8183cda3";
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
    ident = "@types/json-schema";
    ldir  = "info/types/json-schema";
    inherit packument fetchInfo;
  } // latest';

}
