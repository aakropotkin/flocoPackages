{

  inputs.packument.url   = "https://registry.npmjs.org/metro-transform-plugins?rev=36-b52e4d055a2c348ff1f7bc1154b671f9";
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
    ident = "metro-transform-plugins";
    ldir  = "info/unscoped/m/metro-transform-plugins";
    inherit packument fetchInfo;
  } // latest';

}
