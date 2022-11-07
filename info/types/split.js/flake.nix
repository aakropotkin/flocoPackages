{

  inputs.packument.url   = "https://registry.npmjs.org/@types/split.js?rev=327-667d6ca2600dcf581a556467788f0779";
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
    ident = "@types/split.js";
    ldir  = "info/types/split.js";
    inherit packument fetchInfo;
  } // latest';

}
