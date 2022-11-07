{

  inputs.packument.url   = "https://registry.npmjs.org/html-webpack-plugin?rev=429-9608be3ecd196b8f40db7ef511e31f3e";
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
    ident = "html-webpack-plugin";
    ldir  = "info/unscoped/h/html-webpack-plugin";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
