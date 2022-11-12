{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/concat-stream?_rev=549-b0d7b83e97f1a8c6566c4ac5225c4384";
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
    ident = "@types/concat-stream";
    ldir  = "info/types/concat-stream";
    inherit packument fetchInfo;
  } // latest';

}
