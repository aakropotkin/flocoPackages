{

  inputs.packument.url   = "https://registry.npmjs.org/uglify-es?rev=91-e06507770390b7d0cf7f05ead3eaeb28";
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
    ident = "uglify-es";
    ldir  = "info/unscoped/u/uglify-es";
    inherit packument fetchInfo;
  } // latest';

}
