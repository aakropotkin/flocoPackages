{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/formidable?_rev=654-00f1783717e4ff8b668b22307e02dc0b";
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
    ident = "@types/formidable";
    ldir  = "info/types/formidable";
    inherit packument fetchInfo;
  } // latest';

}
