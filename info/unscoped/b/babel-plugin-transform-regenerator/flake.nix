{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-transform-regenerator?rev=127-ed3f754271987a5c779425a90086c052";
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
    ident = "babel-plugin-transform-regenerator";
    ldir  = "info/unscoped/b/babel-plugin-transform-regenerator";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
