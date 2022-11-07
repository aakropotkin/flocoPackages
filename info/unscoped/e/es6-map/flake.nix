{

  inputs.packument.url   = "https://registry.npmjs.org/es6-map?rev=22-4c0bc463d2328cae400a5e745e2f1fee";
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
    ident = "es6-map";
    ldir  = "info/unscoped/e/es6-map";
    inherit packument fetchInfo;
  } // latest';

}
