{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/react-input-autosize?_rev=368-f77335f18425f4bb610c92184129cd72";
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
    ident = "@types/react-input-autosize";
    ldir  = "info/types/react-input-autosize";
    inherit packument fetchInfo;
  } // latest';

}
