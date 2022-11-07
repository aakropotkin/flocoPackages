{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-transform-async-to-generator?rev=100-2c6df10bb7de1a12c00e87328293f87c";
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
    ident = "babel-plugin-transform-async-to-generator";
    ldir  = "info/unscoped/b/babel-plugin-transform-async-to-generator";
    inherit packument fetchInfo;
  } // latest';

}
