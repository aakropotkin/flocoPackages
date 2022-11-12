{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/cors?_rev=622-d9723c6818cc4e7a0241ec935d4bb92f";
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
    ident = "@types/cors";
    ldir  = "info/types/cors";
    inherit packument fetchInfo;
  } // latest';

}
