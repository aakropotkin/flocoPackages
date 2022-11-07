{

  inputs.packument.url   = "https://registry.npmjs.org/graphql?rev=408-877f8aed3e43f5d7b41ed576612b5878";
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
    scope = null;
    ident = "graphql";
    ldir  = "info/unscoped/g/graphql";
    inherit packument fetchInfo;
  } // latest';

}
