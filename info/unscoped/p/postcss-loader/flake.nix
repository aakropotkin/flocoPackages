{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-loader?rev=159-cb26af05ebd891f02f3d4e89fd3133ff";
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
    ident = "postcss-loader";
    ldir  = "info/unscoped/p/postcss-loader";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
