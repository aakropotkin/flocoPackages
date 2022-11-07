{

  inputs.packument.url   = "https://registry.npmjs.org/@types/caseless?rev=517-a640ed987d30233ee51e134afa1016e9";
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
    ident = "@types/caseless";
    ldir  = "info/types/caseless";
    inherit packument fetchInfo;
  } // latest';

}
