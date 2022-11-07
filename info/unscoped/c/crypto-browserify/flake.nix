{

  inputs.packument.url   = "https://registry.npmjs.org/crypto-browserify?rev=178-461741aa491c5c0a7384b962576e65aa";
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
    ident = "crypto-browserify";
    ldir  = "info/unscoped/c/crypto-browserify";
    inherit packument fetchInfo;
  } // latest';

}
