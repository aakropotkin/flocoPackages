{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2freact-dropzone?_rev=191-bc29ae70d90d6d453a61d99d4a8aeaaf";
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
    ident = "@types/react-dropzone";
    ldir  = "info/types/react-dropzone";
    inherit packument fetchInfo;
  } // latest';

}
