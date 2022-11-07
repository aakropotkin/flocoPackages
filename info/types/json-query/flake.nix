{

  inputs.packument.url   = "https://registry.npmjs.org/@types/json-query?rev=528-a7495b8b0b2328637e2c2d0ee5c4e698";
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
    ident = "@types/json-query";
    ldir  = "info/types/json-query";
    inherit packument fetchInfo;
  } // latest';

}
