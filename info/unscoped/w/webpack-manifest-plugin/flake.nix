{

  inputs.packument.url   = "https://registry.npmjs.org/webpack-manifest-plugin?rev=68-ee24d6f9d534162ae634d65d958d773a";
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
    ident = "webpack-manifest-plugin";
    ldir  = "info/unscoped/w/webpack-manifest-plugin";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
