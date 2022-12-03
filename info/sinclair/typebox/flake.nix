{

  inputs.packument.url   = "https://registry.npmjs.org/@sinclair/typebox";
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
    scope = "@sinclair";
    ident = "@sinclair/typebox";
    ldir  = "info/sinclair/typebox";
    inherit packument fetchInfo;
  } // latest';

}
