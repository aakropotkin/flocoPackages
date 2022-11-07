{

  inputs.packument.url   = "https://registry.npmjs.org/@types/react-dom?rev=948-88786e6aeacbb21d63a5942566d2fb68";
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
    ident = "@types/react-dom";
    ldir  = "info/types/react-dom";
    inherit packument fetchInfo;
  } // latest';

}
