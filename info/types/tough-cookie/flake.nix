{

  inputs.packument.url   = "https://registry.npmjs.org/@types/tough-cookie?rev=505-bcbe62941dfe85dd09846a5dd7678a55";
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
    ident = "@types/tough-cookie";
    ldir  = "info/types/tough-cookie";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
