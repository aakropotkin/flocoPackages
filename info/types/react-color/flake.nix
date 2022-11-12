{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/react-color?_rev=529-186aa525edc6fc8897850b46312cc47c";
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
    ident = "@types/react-color";
    ldir  = "info/types/react-color";
    inherit packument fetchInfo;
  } // latest';

}
