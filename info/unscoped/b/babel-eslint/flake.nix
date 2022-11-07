{

  inputs.packument.url   = "https://registry.npmjs.org/babel-eslint?rev=262-38fb1f36759c9a732e25fa2377c90124";
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
    ident = "babel-eslint";
    ldir  = "info/unscoped/b/babel-eslint";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
