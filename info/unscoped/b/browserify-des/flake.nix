{

  inputs.packument.url   = "https://registry.npmjs.org/browserify-des?rev=6-2fde66055e5c478339ee96e56b6a4b63";
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
    ident = "browserify-des";
    ldir  = "info/unscoped/b/browserify-des";
    inherit packument fetchInfo;
  } // latest';

}
