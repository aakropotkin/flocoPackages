{

  inputs.packument.url   = "https://registry.npmjs.org/case-sensitive-paths-webpack-plugin?rev=23-a2a69b9b568d27ba42e0ea8b7cb4ac77";
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
    ident = "case-sensitive-paths-webpack-plugin";
    ldir  = "info/unscoped/c/case-sensitive-paths-webpack-plugin";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
