{

  inputs.packument.url   = "https://registry.npmjs.org/sourcemap-codec?rev=20-8b335c1dda585efb5153018be4142558";
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
    ident = "sourcemap-codec";
    ldir  = "info/unscoped/s/sourcemap-codec";
    inherit packument fetchInfo;
  } // latest';

}
