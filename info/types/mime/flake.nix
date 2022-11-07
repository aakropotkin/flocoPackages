{

  inputs.packument.url   = "https://registry.npmjs.org/@types/mime?rev=600-8ecb8c409f8cdae797fea8fe78a9b8c7";
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
    ident = "@types/mime";
    ldir  = "info/types/mime";
    inherit packument fetchInfo;
  } // latest';

}
