{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-transform-es2015-block-scoping?rev=118-1cffc2a885c6171cb1b0b86fba61ee04";
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
    ident = "babel-plugin-transform-es2015-block-scoping";
    ldir  = "info/unscoped/b/babel-plugin-transform-es2015-block-scoping";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
