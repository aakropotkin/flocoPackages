{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-transform-es2015-object-super?rev=74-12a2557369955816b3b43886e5e02120";
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
    ident = "babel-plugin-transform-es2015-object-super";
    ldir  = "info/unscoped/b/babel-plugin-transform-es2015-object-super";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
