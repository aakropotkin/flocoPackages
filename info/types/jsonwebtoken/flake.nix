{

  inputs.packument.url   = "https://registry.npmjs.org/@types/jsonwebtoken?rev=797-36175f61f2bdd22b6ff42f59fa0f02aa";
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
    ident = "@types/jsonwebtoken";
    ldir  = "info/types/jsonwebtoken";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
