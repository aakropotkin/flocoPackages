{

  inputs.packument.url   = "https://registry.npmjs.org/node-gyp-build-optional-packages?rev=9-331888c134fe8848bfc72bbb8b8d2d04";
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
    ident = "node-gyp-build-optional-packages";
    ldir  = "info/unscoped/n/node-gyp-build-optional-packages";
    inherit packument fetchInfo;
  } // latest';

}
