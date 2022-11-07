{

  inputs.packument.url   = "https://registry.npmjs.org/cjs-module-lexer?rev=38-a8400481e9cf5929c84488a73a19cdc5";
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
    ident = "cjs-module-lexer";
    ldir  = "info/unscoped/c/cjs-module-lexer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
