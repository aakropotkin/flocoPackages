{

  inputs.packument.url   = "https://registry.npmjs.org/@types/ws?rev=970-0ff2f7a5134d2b993e0340f1945d0325";
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
    ident = "@types/ws";
    ldir  = "info/types/ws";
    inherit packument fetchInfo;
  } // latest';

}
