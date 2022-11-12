{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/long?_rev=558-394c14f6b94f7e86aae39a4b31ae9ab8";
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
    ident = "@types/long";
    ldir  = "info/types/long";
    inherit packument fetchInfo;
  } // latest';

}
