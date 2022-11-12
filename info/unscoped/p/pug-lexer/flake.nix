{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/pug-lexer?_rev=41-9457f93f92191c92e6d60a386a07b79a";
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
    ident = "pug-lexer";
    ldir  = "info/unscoped/p/pug-lexer";
    inherit packument fetchInfo;
  } // latest';

}
