{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-replace-overflow-wrap?rev=10-2a945d2d8904211cb0c4c710f259b1e3";
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
    ident = "postcss-replace-overflow-wrap";
    ldir  = "info/unscoped/p/postcss-replace-overflow-wrap";
    inherit packument fetchInfo;
  } // latest';

}
