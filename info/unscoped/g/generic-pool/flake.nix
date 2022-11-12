{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/generic-pool?_rev=155-e9f21b85ec1882fde9e8228fe6aabb12";
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
    ident = "generic-pool";
    ldir  = "info/unscoped/g/generic-pool";
    inherit packument fetchInfo;
  } // latest';

}
