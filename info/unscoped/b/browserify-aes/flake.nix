{

  inputs.packument.url   = "https://registry.npmjs.org/browserify-aes?rev=56-0255f4c577ce1419c3e8924d85cab5b9";
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
    ident = "browserify-aes";
    ldir  = "info/unscoped/b/browserify-aes";
    inherit packument fetchInfo;
  } // latest';

}
