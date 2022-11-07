{

  inputs.packument.url   = "https://registry.npmjs.org/@types/jest?rev=1762-ca96e8e68db617978b41c69abb58604d";
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
    ident = "@types/jest";
    ldir  = "info/types/jest";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
