{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2freact-jsonschema-form?_rev=558-20ab29c4825db8dbe6b17a9d7f0e105d";
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
    ident = "@types/react-jsonschema-form";
    ldir  = "info/types/react-jsonschema-form";
    inherit packument fetchInfo;
  } // latest';

}
