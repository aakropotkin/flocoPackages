{

  inputs.packument.url   = "https://registry.npmjs.org/browserify-rsa?rev=28-88c5b37bdd8e9543341c47dac72e3979";
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
    ident = "browserify-rsa";
    ldir  = "info/unscoped/b/browserify-rsa";
    inherit packument fetchInfo;
  } // latest';

}
