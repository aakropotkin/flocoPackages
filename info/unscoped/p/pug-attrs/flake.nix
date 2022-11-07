{

  inputs.packument.url   = "https://registry.npmjs.org/pug-attrs?rev=17-d1b0fcec107f542027e8cf13e8cb961b";
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
    ident = "pug-attrs";
    ldir  = "info/unscoped/p/pug-attrs";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
