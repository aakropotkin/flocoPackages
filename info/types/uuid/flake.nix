{

  inputs.packument.url   = "https://registry.npmjs.org/@types/uuid?rev=659-6f54e38c22045f89d11841d20bb45c60";
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
    ident = "@types/uuid";
    ldir  = "info/types/uuid";
    inherit packument fetchInfo;
  } // latest';

}
