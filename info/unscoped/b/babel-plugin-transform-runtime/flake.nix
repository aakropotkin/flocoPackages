{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-transform-runtime?rev=128-0edb909b6ce61a87ccc2827e8c6ba496";
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
    ident = "babel-plugin-transform-runtime";
    ldir  = "info/unscoped/b/babel-plugin-transform-runtime";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
