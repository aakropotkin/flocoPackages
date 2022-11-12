{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/es-module-lexer?_rev=56-f3b6c92a3a197096fea7badaeb1ae1d9";
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
    ident = "es-module-lexer";
    ldir  = "info/unscoped/e/es-module-lexer";
    inherit packument fetchInfo;
  } // latest';

}
