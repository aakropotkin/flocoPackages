{

  inputs.packument.url   = "https://registry.npmjs.org/@types/debug?rev=677-d669bf4bfb72d09ce612881636d2cc70";
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
    ident = "@types/debug";
    ldir  = "info/types/debug";
    inherit packument fetchInfo;
  } // latest';

}
